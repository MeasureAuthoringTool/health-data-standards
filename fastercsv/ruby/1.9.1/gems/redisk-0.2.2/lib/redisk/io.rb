module Redisk
  class IO
    include Enumerable
    extend Helper
    include Helper
    
    class NotImplementedError < RuntimeError; end
    class EOFError < ::EOFError; end
    class IOError < ::IOError; end
    
    attr_reader :name, :mode, :_
  
    def initialize(name, mode = 'r')
      @name         = name
      @mode         = mode # we're going to just ignore this for now
      @read_open    = true
      @write_open   = true
      @write_buffer = nil
      @read_buffer  = nil
      @sync         = false
      @pos          = 0
      @lineno       = 0
      @size         = stat.size > 0 ? stat.size : true_size
      # add io to the list of ios
      redis.sadd dir, name
      rewind
    end
    alias :for_fd :initialize

    def self.list_key(name)
      "#{name}:_list"
    end
  
    def list_key
      self.class.list_key(name)
    end
    
    def self.all
      redis.smembers dir
    end
  
    def self.dir
      "__ios__"
    end
    
    def dir
      self.class.dir
    end
    
    # Executes the block for every line in the named I/O port, where lines are 
    # separated by sep_string.
    # 
    #    IO.foreach("testfile") {|x| print "GOT ", x }
    # produces:
    # 
    #    GOT This is line one
    #    GOT This is line two
    #    GOT This is line three
    #    GOT And so on...
    def self.foreach(name, &block)
      io = new(name)
      io.each_line(&block)
      io.close
    end
  
    # With no associated block, open is a synonym for IO::new. If the optional 
    # code block is given, it will be passed io as an argument, and the IO 
    # object will automatically be closed when the block terminates. In this 
    # instance, IO::open returns the value of the block.
    def self.open(name, mode = 'r')
      io = new(name, mode)
      returned = block_given? ? yield(io) : io
      io.close
      returned
    end
  
    # IO.pipe → array
    # Creates a pair of pipe endpoints (connected to each other) and returns 
    # them as a two-element array of IO objects: [ read_file, write_file ]. 
    # Not available on all platforms.
    # 
    # In the example below, the two processes close the ends of the pipe that 
    # they are not using. This is not just a cosmetic nicety. The read end of 
    # a pipe will not generate an end of file condition if there are any 
    # writers with the pipe still open. In the case of the parent process, the 
    # rd.read will never return if it does not first issue a wr.close.
    # 
    #    rd, wr = IO.pipe
    # 
    #    if fork
    #      wr.close
    #      puts "Parent got: <#{rd.read}>"
    #      rd.close
    #      Process.wait
    #    else
    #      rd.close
    #      puts "Sending message to parent"
    #      wr.write "Hi Dad"
    #      wr.close
    #    end
    # produces:
    # 
    #    Sending message to parent
    #    Parent got: <Hi Dad>
    def self.pipe
      raise NotImplementedError, ".pipe is not implemented"
    end
  
    # Opens the file, optionally seeks to the given offset, then returns 
    # length bytes (defaulting to the rest of the file). read ensures the file 
    # is closed before returning.
    # 
    #    IO.read("testfile")           #=> "This is line one\nThis is line 
    # two\nThis is line three\nAnd so on...\n"
    #    IO.read("testfile", 20)       #=> "This is line one\nThi"
    #    IO.read("testfile", 20, 10)   #=> "ne one\nThis is line "
    def self.read(name, length = nil, offset = nil)
      io = new(name)
      io.seek(offset) if offset
      returned = io.read(length)
      io.close
      returned
    end
    
    # Works similarly to IO.read, but operates on lines instead of bytes
    def self.read_lines(name, length = nil, offset = nil)
      start_i = offset || 0
      end_i   = length ? start_i + (length - 1) : -1
      values  = redis.lrange(list_key(name), start_i, end_i)
      values.join
    end
      
    # Reads the entire file specified by name as individual lines, and returns 
    # those lines in an array. Lines are separated by sep_string.
    # 
    #    a = IO.readlines("testfile")
    #    a[0]   #=> "This is line one\n"
    def self.readlines(name)
      redis.lrange(list_key(name), 0, -1) || []
    end
  
    # IO.select(read_array 
    # [, write_array 
    # [, error_array 
    # [, timeout]]] ) => array or nil
    # See Kernel#select.
    def self.select(name)
      raise NotImplementedError, ".select is not implemented"
    end
  
    # IO.sysopen(path, [mode, [perm]]) => fixnum
    # Opens the given path, returning the underlying file descriptor as a 
    # Fixnum.
    # 
    #    IO.sysopen("testfile")   #=> 3
    def self.sysopen(name)
      raise NotImplementedError, ".sysopen is not implemented"
    end
  
    # Removes all references to the io at name
    def self.unlink(name)
      redis.keys("#{name}:*").each do |key|
        redis.del key.gsub('redisk:','')
      end
      redis.srem dir, name
      nil
    end

    # Reads the contents of file into the IO. 
    # If file is not a File its taken as a path and passed to File.open
    def self.from_file(name, file)
      io = new(name)
      io.from_file(file)
      io
    end
    
    # Writes the contents of IO into file.
    # If file is not a File its taken as a path and passed to File.open
    def self.to_file(name, file)
      io   = new(name)
      io.to_file(file)
      io
    end

    # String Output—Writes obj to ios. obj will be converted to a string using 
    # to_s.
    # 
    #    $stdout << "Hello " << "world!\n"
    # produces:
    # 
    #    Hello world!
    def <<(text)
      @write_buffer ||= ''
      @write_buffer << text
      flush if sync
      @write_buffer
    end
    
    # ios.binmode => ios
    # Puts ios into binary mode. This is useful only in MS-DOS/Windows 
    # environments. Once a stream is in binary mode, it cannot be reset to 
    # nonbinary mode.
    # 
    def binmode; end
    
    # ios.close => nil
    # Closes ios and flushes any pending writes to the operating system. The 
    # stream is unavailable for any further data operations; an IOError is 
    # raised if such an attempt is made. I/O streams are automatically closed 
    # when they are claimed by the garbage collector.
    # 
    # If ios is opened by IO.popen, close sets $?.
    def close
      flush
      close_read
      close_write
    end 
    
    # ios.close_read => nil
    # Closes the read end of a duplex I/O stream (i.e., one that contains both 
    # a read and a write stream, such as a pipe). Will raise an IOError if the 
    # stream is not duplexed.
    # 
    #    f = IO.popen("/bin/sh","r+")
    #    f.close_read
    #    f.readlines
    # produces:
    # 
    #    prog.rb:3:in `readlines': not opened for reading (IOError)
    #     from prog.rb:3
    def close_read
      @read_open = false
      nil
    end
    
    # ios.close_write => nil
    # Closes the write end of a duplex I/O stream (i.e., one that contains 
    # both a read and a write stream, such as a pipe). Will raise an IOError 
    # if the stream is not duplexed.
    # 
    #    f = IO.popen("/bin/sh","r+")
    #    f.close_write
    #    f.print "nowhere"
    # produces:
    # 
    #    prog.rb:3:in `write': not opened for writing (IOError)
    #     from prog.rb:3:in `print'
    #     from prog.rb:3
    def close_write
      @write_open = false
      nil
    end

    # ios.closed? => true or false
    # Returns true if ios is completely closed (for duplex streams, both 
    # reader and writer), false otherwise.
    # 
    #    f = File.new("testfile")
    #    f.close         #=> nil
    #    f.closed?       #=> true
    #    f = IO.popen("/bin/sh","r+")
    #    f.close_write   #=> nil
    #    f.closed?       #=> false
    #    f.close_read    #=> nil
    #    f.closed?       #=> true
    def closed?
      !(@write_open || @read_open)
    end
    
    # ios.each(sep_string=$/) {|line| block } => ios
    # ios.each_line(sep_string=$/) {|line| block } => ios
    # Executes the block for every line in ios, where lines are separated by 
    # sep_string. ios must be opened for reading or an IOError will be raised.
    # 
    #    f = File.new("testfile")
    #    f.each {|line| puts "#{f.lineno}: #{line}" }
    # produces:
    # 
    #    1: This is line one
    #    2: This is line two
    #    3: This is line three
    #    4: And so on...
    def each(&block)
      rewind
      length.times do 
        yield gets
      end
      self
    end
    alias :each_line :each
    
    # ios.each_byte {|byte| block } => nil
    # Calls the given block once for each byte (0..255) in ios, passing the 
    # byte as an argument. The stream must be opened for reading or an IOError 
    # will be raised.
    # 
    #    f = File.new("testfile")
    #    checksum = 0
    #    f.each_byte {|x| checksum ^= x }   #=> #<File:testfile>
    #    checksum                           #=> 12
    def each_byte
      rewind
      while !eof?
        yield getc
      end
      self
    end
    
    # ios.eof => true or false
    # ios.eof? => true or false
    # Returns true if ios is at end of file that means there are no more data 
    # to read. The stream must be opened for reading or an IOError will be 
    # raised.
    # 
    #    f = File.new("testfile")
    #    dummy = f.readlines
    #    f.eof   #=> true
    # If ios is a stream such as pipe or socket, IO#eof? blocks until the 
    # other end sends some data or closes it.
    # 
    #    r, w = IO.pipe
    #    Thread.new { sleep 1; w.close }
    #    r.eof?  #=> true after 1 second blocking
    # 
    #    r, w = IO.pipe
    #    Thread.new { sleep 1; w.puts "a" }
    #    r.eof?  #=> false after 1 second blocking
    # 
    #    r, w = IO.pipe
    #    r.eof?  # blocks forever
    # Note that IO#eof? reads data to a input buffer. So IO#sysread doesn‘t 
    # work with IO#eof?.
    def eof
      lineno >= length || pos >= size
    end
    alias :eof? :eof
    
    # ios.fcntl(integer_cmd, arg) => integer
    # Provides a mechanism for issuing low-level commands to control or query 
    # file-oriented I/O streams. Arguments and results are platform dependent. 
    # If arg is a number, its value is passed directly. If it is a string, it 
    # is interpreted as a binary sequence of bytes (Array#pack might be a 
    # useful way to build this string). On Unix platforms, see fcntl(2) for 
    # details. Not implemented on all platforms.
    def fcntl(integer_cmd, arg)
      
    end
    
    # ios.fileno => fixnum
    # ios.to_i => fixnum
    # Returns an integer representing the numeric file descriptor for ios.
    # 
    #    $stdin.fileno    #=> 0
    #    $stdout.fileno   #=> 1
    def fileno
    end
    alias :to_i :fileno
    
    # ios.flush => ios
    # Flushes any buffered data within ios to the underlying operating system 
    # (note that this is Ruby internal buffering only; the OS may buffer the 
    # data as well).
    # 
    #    $stdout.print "no newline"
    #    $stdout.flush
    # produces:
    # 
    #    no newline
    def flush
      if @write_buffer && @write_buffer != ''
        redis.rpush list_key, @write_buffer
        @size += @write_buffer.length
        stat.write_attribute(:size, @size)
        stat.write_attribute(:mtime, Time.now)
      end
      @write_buffer = nil
    end
    
    # ios.fsync => 0 or nil
    # Immediately writes all buffered data in ios to disk. Returns nil if the 
    # underlying operating system does not support fsync(2). Note that fsync 
    # differs from using IO#sync=. The latter ensures that data is flushed 
    # from Ruby‘s buffers, but doesn‘t not guarantee that the underlying 
    # operating system actually writes it to disk.
    def fsync
      false
    end
    
    # Reads the contents of file into the IO. 
    # If file is not a File its taken as a path and passed to File.open
    # Returns the IO
    def from_file(file)
      file = File.open(file, 'r') if !file.is_a?(File)
      file.each_line do |l|
        write l
      end
      file.close
      self
    end
    
    # Writes the contents of IO into file.
    # If file is not a File its taken as a path and passed to File.open
    # Returns the IO
    def to_file(file)
      file = File.open(file, 'w') if !file.is_a?(File)
      each_line do |l|
        file.write l
      end
      file.close
      self
    end
    
    # ios.getc => fixnum or nil
    # Gets the next 8-bit byte (0..255) from ios. Returns nil if called at end 
    # of file.
    # 
    #    f = File.new("testfile")
    #    f.getc   #=> 84
    #    f.getc   #=> 104
    def getc
      read(1).to_s.ord
    end
    
    # ios.gets(sep_string=$/) => string or nil
    # Reads the next ``line’’ from the I/O stream; lines are separated by 
    # sep_string. A separator of nil reads the entire contents, and a 
    # zero-length separator reads the input a paragraph at a time (two 
    # successive newlines in the input separate paragraphs). The stream must 
    # be opened for reading or an IOError will be raised. The line read in 
    # will be returned and also assigned to $_. Returns nil if called at end 
    # of file.
    # 
    #    File.new("testfile").gets   #=> "This is line one\n"
    #    $_                          #=> "This is line one\n"
    def gets
      check_stream_open!(:read)
      flush
      return nil if eof?
      val = redis.lrange(list_key, lineno, lineno + 1)
      if val = val.first
        self.lineno += 1
        $_ = @_ = val
        @pos += val.length
        val
      end
    end
    
    # Return a string describing this IO object.
    def inspect
      "#<Redisk::IO (#{name})>"
    end
    alias :to_s :inspect
    
    # 
    # ios.ioctl(integer_cmd, arg) => integer
    # Provides a mechanism for issuing low-level commands to control or query 
    # I/O devices. Arguments and results are platform dependent. If arg is a 
    # number, its value is passed directly. If it is a string, it is 
    # interpreted as a binary sequence of bytes. On Unix platforms, see 
    # ioctl(2) for details. Not implemented on all platforms.
    # 
    def ioctl(integer_cmd, arg)
    end
    
    # ios.isatty => true or false
    # ios.tty? => true or false
    # Returns true if ios is associated with a terminal device (tty), false 
    # otherwise.
    def isatty
      false
    end
    
    # the number of lines in the current list/file
    def length
      redis.llen list_key
    end
    alias :lines :length
    
    # the estimated size in bytes of the current file
    def size
      @size
    end
    
    def true_size
      readlines.join.length
    end
    
    # ios.lineno => integer
    # Returns the current line number in ios. The stream must be opened for 
    # reading. lineno counts the number of times gets is called, rather than 
    # the number of newlines encountered. The two values will differ if gets 
    # is called with a separator other than newline. See also the $. variable.
    # 
    #    f = File.new("testfile")
    #    f.lineno   #=> 0
    #    f.gets     #=> "This is line one\n"
    #    f.lineno   #=> 1
    #    f.gets     #=> "This is line two\n"
    #    f.lineno   #=> 2
    def lineno
      @lineno
    end
    
    # ios.lineno = integer => integer
    # Manually sets the current line number to the given value. $. is updated 
    # only on the next read.
    # 
    #    f = File.new("testfile")
    #    f.gets                     #=> "This is line one\n"
    #    $.                         #=> 1
    #    f.lineno = 1000
    #    f.lineno                   #=> 1000
    #    $. # lineno of last read   #=> 1
    #    f.gets                     #=> "This is line two\n"
    #    $. # lineno of last read   #=> 1001
    def lineno=(num)
      @lineno = num.to_i
    end
    
    def open?(stream = nil)
      if stream
        instance_variable_get("@#{stream}_open")
      else
        @write_open && @read_open
      end
    end
    
    # ios.pid => fixnum
    # Returns the process ID of a child process associated with ios. This will 
    # be set by IO::popen.
    # 
    #    pipe = IO.popen("-")
    #    if pipe
    #      $stderr.puts "In parent, child pid is #{pipe.pid}"
    #    else
    #      $stderr.puts "In child, pid is #{$$}"
    #    end
    # produces:
    # 
    #    In child, pid is 26209
    #    In parent, child pid is 26209
    def pid
      Process.pid
    end
    
    # ios.pos => integer
    # ios.tell => integer
    # Returns the current offset (in bytes) of ios.
    # 
    #    f = File.new("testfile")
    #    f.pos    #=> 0
    #    f.gets   #=> "This is line one\n"
    #    f.pos    #=> 17
    def pos
      @pos
    end
    alias :tell :pos
    
    # ios.pos = integer => integer
    # Seeks to the given position (in bytes) in ios.
    # 
    #    f = File.new("testfile")
    #    f.pos = 17
    #    f.gets   #=> "This is line two\n"
    def pos=(num)
      current_pos = @pos
      if num < current_pos
        @pos = 0
      else
        num -= current_pos
      end
      read(num)
    end
      
    # ios.print() => nil
    # ios.print(obj, ...) => nil
    # Writes the given object(s) to ios. The stream must be opened for 
    # writing. If the output record separator ($\) is not nil, it will be 
    # appended to the output. If no arguments are given, prints $_. Objects 
    # that aren‘t strings will be converted by calling their to_s method. With 
    # no argument, prints the contents of the variable $_. Returns nil.
    # 
    #    $stdout.print("This is ", 100, " percent.\n")
    # produces:
    # 
    #    This is 100 percent.
    def print(*args)
      args.empty? ?
        write(@_) :
        write(args.collect {|a| a.to_s }.join)
      nil
    end
    
    # ios.printf(format_string [, obj, ...] ) => nil
    # Formats and writes to ios, converting parameters under control of the 
    # format string. See Kernel#sprintf for details.
    def printf(format_string, *args)
      write sprintf(format_string, *args)
      nil
    end
    
    # ios.putc(obj) => obj
    # If obj is Numeric, write the character whose code is obj, otherwise 
    # write the first character of the string representation of obj to ios.
    # 
    #    $stdout.putc "A"
    #    $stdout.putc 65
    # produces:
    # 
    #    AA
    def putc(obj)
      self << obj.is_a?(Fixnum) ? obj : obj.to_s[0]
    end
    
    # ios.puts(obj, ...) => nil
    # Writes the given objects to ios as with IO#print. Writes a record 
    # separator (typically a newline) after any that do not already end with a 
    # newline sequence. If called with an array argument, writes each element 
    # on a new line. If called without arguments, outputs a single record 
    # separator.
    # 
    #    $stdout.puts("this", "is", "a", "test")
    # produces:
    # 
    #    this
    #    is
    #    a
    #    test
    def puts(*args)
      args.empty? ? 
        write("\n") :
        args.each {|a| 
          a += "\n" if a !~ /\n$/
          write(a) 
        }
      nil
    end
    
    # ios.read([length [, buffer]]) => string, buffer, or nil
    # Reads at most length bytes from the I/O stream, or to the end of file if 
    # length is omitted or is nil. length must be a non-negative integer or 
    # nil. If the optional buffer argument is present, it must reference a 
    # String, which will receive the data.
    # 
    # At end of file, it returns nil or "" depend on length. ios.read() and 
    # ios.read(nil) returns "". ios.read(positive-integer) returns nil.
    # 
    #    f = File.new("testfile")
    #    f.read(16)   #=> "This is line one"
    def read(length = nil, buffer = nil)
      check_stream_open!(:read)
      if eof
        length ? nil : ""
      else
        if length 
          @read_buffer ||= ""
          fetched = false
          while @read_buffer.length < length && !eof?
            @read_buffer << gets.to_s
            fetched = true
          end
          result = @read_buffer[0...length]
          @read_buffer = @read_buffer[length..-1] || ""
          if fetched
            @pos -= @read_buffer.length 
          else
            @pos += result.length
          end
        else
          result = readlines.join
        end
        buffer ? buffer.replace(buffer + result) : result
      end
    end
    
    # ios.read_nonblock(maxlen) => string
    # ios.read_nonblock(maxlen, outbuf) => outbuf
    # Reads at most maxlen bytes from ios using read(2) system call after 
    # O_NONBLOCK is set for the underlying file descriptor.
    # 
    # If the optional outbuf argument is present, it must reference a String, 
    # which will receive the data.
    # 
    # read_nonblock just calls read(2). It causes all errors read(2) causes: 
    # EAGAIN, EINTR, etc. The caller should care such errors.
    # 
    # read_nonblock causes EOFError on EOF.
    # 
    # If the read buffer is not empty, read_nonblock reads from the buffer 
    # like readpartial. In this case, read(2) is not called.
    #
    def read_nonblock
      
    end
    

    # readbytes(n)
    # Reads exactly n bytes.
    # 
    # If the data read is nil an EOFError is raised.
    # 
    # If the data read is too short a TruncatedDataError is raised and the 
    # read data is obtainable via its data method.
    # 
    def readbytes(n)
      result = read(n)
      if result && result.length < n
        raise TruncatedDataError, result
      elsif result.nil?
        raise EOFError, "You have reached the end of the IO stream"
      else
        result
      end
    end
    
    # ios.readchar => fixnum
    # Reads a character as with IO#getc, but raises an EOFError on end of 
    # file.
    def readchar
      
    end
    
    # ios.readline(sep_string=$/) => string
    # Reads a line as with IO#gets, but raises an EOFError on end of file.
    def readline
      if eof? 
        raise EOFError, "At the end of the IO #{inspect}"
      else
        gets
      end
    end
    
    # ios.readlines(sep_string=$/) => array
    # Reads all of the lines in ios, and returns them in anArray. Lines are 
    # separated by the optional sep_string. If sep_string is nil, the rest of 
    # the stream is returned as a single record. The stream must be opened for 
    # reading or an IOError will be raised.
    # 
    #    f = File.new("testfile")
    #    f.readlines[0]   #=> "This is line one\n"
    def readlines
      check_stream_open!(:read)
      self.class.readlines(name)
    end
    
    # ios.readpartial(maxlen) => string
    # ios.readpartial(maxlen, outbuf) => outbuf
    # Reads at most maxlen bytes from the I/O stream. It blocks only if ios 
    # has no data immediately available. It doesn‘t block if some data 
    # available. If the optional outbuf argument is present, it must reference 
    # a String, which will receive the data. It raises EOFError on end of 
    # file.
    # 
    # readpartial is designed for streams such as pipe, socket, tty, etc. It 
    # blocks only when no data immediately available. This means that it 
    # blocks only when following all conditions hold.
    # 
    # the buffer in the IO object is empty.
    # the content of the stream is empty.
    # the stream is not reached to EOF.
    # When readpartial blocks, it waits data or EOF on the stream. If some 
    # data is reached, readpartial returns with the data. If EOF is reached, 
    # readpartial raises EOFError.
    # 
    # When readpartial doesn‘t blocks, it returns or raises immediately. If 
    # the buffer is not empty, it returns the data in the buffer. Otherwise if 
    # the stream has some content, it returns the data in the stream. 
    # Otherwise if the stream is reached to EOF, it raises EOFError.
    # 
    #    r, w = IO.pipe           #               buffer          pipe content
    #    w << "abc"               #               ""              "abc".
    #    r.readpartial(4096)      #=> "abc"       ""              ""
    #    r.readpartial(4096)      # blocks because buffer and pipe is empty.
    # 
    #    r, w = IO.pipe           #               buffer          pipe content
    #    w << "abc"               #               ""              "abc"
    #    w.close                  #               ""              "abc" EOF
    #    r.readpartial(4096)      #=> "abc"       ""              EOF
    #    r.readpartial(4096)      # raises EOFError
    # 
    #    r, w = IO.pipe           #               buffer          pipe content
    #    w << "abc\ndef\n"        #               ""              "abc\ndef\n"
    #    r.gets                   #=> "abc\n"     "def\n"         ""
    #    w << "ghi\n"             #               "def\n"         "ghi\n"
    #    r.readpartial(4096)      #=> "def\n"     ""              "ghi\n"
    #    r.readpartial(4096)      #=> "ghi\n"     ""              ""
    # Note that readpartial behaves similar to sysread. The differences are:
    # 
    # If the buffer is not empty, read from the buffer instead of "sysread for 
    # buffered IO (IOError)".
    # It doesn‘t cause Errno::EAGAIN and Errno::EINTR. When readpartial meets 
    # EAGAIN and EINTR by read system call, readpartial retry the system call.
    # The later means that readpartial is nonblocking-flag insensitive. It 
    # blocks on the situation IO#sysread causes Errno::EAGAIN as if the fd is 
    # blocking mode.
    # 
    def readpartial
      
    end
    
    # ios.reopen(other_IO) => ios 
    # ios.reopen(path, mode_str) => ios
    # Reassociates ios with the I/O stream given in other_IO or to a new 
    # stream opened on path. This may dynamically change the actual class of 
    # this stream.
    # 
    #    f1 = File.new("testfile")
    #    f2 = File.new("testfile")
    #    f2.readlines[0]   #=> "This is line one\n"
    #    f2.reopen(f1)     #=> #<File:testfile>
    #    f2.readlines[0]   #=> "This is line one\n"
    def reopen()
      
    end
    
    # ios.rewind => 0
    # Positions ios to the beginning of input, resetting lineno to zero.
    # 
    #    f = File.new("testfile")
    #    f.readline   #=> "This is line one\n"
    #    f.rewind     #=> 0
    #    f.lineno     #=> 0
    #    f.readline   #=> "This is line one\n"
    def rewind
      self.lineno = 0
      self.pos    = 0
    end
    
    # scanf(str,&b)
    # The trick here is doing a match where you grab one line of input at a 
    # time. The linebreak may or may not occur at the boundary where the 
    # string matches a format specifier. And if it does, some rule about 
    # whitespace may or may not be in effect…
    # 
    # That‘s why this is much more elaborate than the string version.
    # 
    # For each line: Match succeeds (non-emptily) and the last attempted 
    # spec/string sub-match succeeded:
    # 
    #   could the last spec keep matching?
    #     yes: save interim results and continue (next line)
    # The last attempted spec/string did not match:
    # 
    # are we on the next-to-last spec in the string?
    # 
    #   yes:
    #     is fmt_string.string_left all spaces?
    #       yes: does current spec care about input space?
    #         yes: fatal failure
    #         no: save interim results and continue
    #   no: continue  [this state could be analyzed further]
    def scanf
      
    end
    
    SEEK_SET = 0
    SEEK_CUR = 1
    SEEK_END = 2
    
    # ios.seek(amount, whence=SEEK_SET) → 0
    # Seeks to a given offset anInteger in the stream according to the value 
    # of whence:
    # 
    #   IO::SEEK_CUR  | Seeks to _amount_ plus current position
    #   --------------+----------------------------------------------------
    #   IO::SEEK_END  | Seeks to _amount_ plus end of stream (you probably
    #                 | want a negative value for _amount_)
    #   --------------+----------------------------------------------------
    #   IO::SEEK_SET  | Seeks to the absolute location given by _amount_
    # Example:
    # 
    #    f = File.new("testfile")
    #    f.seek(-13, IO::SEEK_END)   #=> 0
    #    f.readline                  #=> "And so on...\n"
    def seek(offset, whence = SEEK_SET)
      case whence
      when SEEK_SET
        self.pos = offset
      when SEEK_END
        self.pos = size + offset
      when SEEK_CUR
        self.pos += offset
      end
      0
    end
    
    # works just like seek, but seeks by lineno instead of pos
    def seek_lines(offset, whence = SEEK_SET)
      case whence
      when SEEK_SET
        self.lineno = offset
      when SEEK_END
        self.lineno = length + offset
      when SEEK_CUR
        self.lineno += offset
      end
      0
    end
    
    # ios.stat => stat
    # Returns status information for ios as an object of type File::Stat.
    # 
    #    f = File.new("testfile")
    #    s = f.stat
    #    "%o" % s.mode   #=> "100644"
    #    s.blksize       #=> 4096
    #    s.atime         #=> Wed Apr 09 08:53:54 CDT 2003
    def stat
      @stat ||= Redisk::Stat.new(name)
    end
    
    # ios.sync => true or false
    # Returns the current ``sync mode’’ of ios. When sync mode is true, all 
    # output is immediately flushed to the underlying operating system and is 
    # not buffered by Ruby internally. See also IO#fsync.
    # 
    #    f = File.new("testfile")
    #    f.sync   #=> false
    def sync
      @sync
    end
    
    # ios.sync = boolean => boolean
    # Sets the ``sync mode’’ to true or false. When sync mode is true, all 
    # output is immediately flushed to the underlying operating system and is 
    # not buffered internally. Returns the new state. See also IO#fsync.
    # 
    #    f = File.new("testfile")
    #    f.sync = true
    # (produces no output)
    def sync=(setting)
      @sync = !!setting
    end
    
    # ios.sysread(integer ) => string
    # Reads integer bytes from ios using a low-level read and returns them as 
    # a string. Do not mix with other methods that read from ios or you may 
    # get unpredictable results. Raises SystemCallError on error and EOFError 
    # at end of file.
    # 
    #    f = File.new("testfile")
    #    f.sysread(16)   #=> "This is line one"
    def sysread(num)
      
    end
    
    # ios.sysseek(offset, whence=SEEK_SET) => integer
    # Seeks to a given offset in the stream according to the value of whence 
    # (see IO#seek for values of whence). Returns the new offset into the 
    # file.
    # 
    #    f = File.new("testfile")
    #    f.sysseek(-13, IO::SEEK_END)   #=> 53
    #    f.sysread(10)                  #=> "And so on."
    def sysseek(offset, whence = SEEK_SET)
    end
    
    # ios.syswrite(string) => integer
    # Writes the given string to ios using a low-level write. Returns the 
    # number of bytes written. Do not mix with other methods that write to ios 
    # or you may get unpredictable results. Raises SystemCallError on error.
    # 
    #    f = File.new("out", "w")
    #    f.syswrite("ABCDEF")   #=> 6
    def syswrite(string)
      
    end
    
    # truncate the IO to size, taking only the last [size] lines
    def truncate(size = 0)
      size = size.to_i
      if size == 0
        redis.del list_key
      else
        redis.ltrim list_key, -size, -1
      end
      stat.write_attribute(:size, @size = true_size)
      length
    end
    
    # ios.ungetc(integer) => nil
    # Pushes back one character (passed as a parameter) onto ios, such that a 
    # subsequent buffered read will return it. Only one character may be 
    # pushed back before a subsequent read operation (that is, you will be 
    # able to read only the last of several characters that have been pushed 
    # back). Has no effect with unbuffered reads (such as IO#sysread).
    # 
    #    f = File.new("testfile")   #=> #<File:testfile>
    #    c = f.getc                 #=> 84
    #    f.ungetc(c)                #=> nil
    #    f.getc                     #=> 84
    def ungetc(integer)
      check_stream_open!(:write)
      char = ("" << integer)
      self << char
      nil
    end
    
    # Removes all references to the IO and closes it for reading and writing
    def unlink
      close
      self.class.unlink(name)
    end
    alias :delete :unlink
    
    # ios.write(string) => integer
    # Writes the given string to ios. The stream must be opened for writing. 
    # If the argument is not a string, it will be converted to a string using 
    # to_s. Returns the number of bytes written.
    # 
    #    count = $stdout.write( "This is a test\n" )
    #    puts "That was #{count} bytes of data"
    # produces:
    # 
    #    This is a test
    #    That was 15 bytes of data
    def write(string)
      check_stream_open!(:write)
      string = string.to_s
      self << string
      flush
      string.length
    end
    
    # ios.write_nonblock(string) => integer
    # Writes the given string to ios using write(2) system call after 
    # O_NONBLOCK is set for the underlying file descriptor.
    # 
    # write_nonblock just calls write(2). It causes all errors write(2) 
    # causes: EAGAIN, EINTR, etc. The result may also be smaller than 
    # string.length (partial write). The caller should care such errors and 
    # partial write.
    # 
    def write_nonblock(string)
    end
    
    private
    def check_stream_open!(stream = :read)
      raise(IOError, "#{self} is not open for #{stream}ing") unless open?(stream)
    end
    
  end
end