# Redisk::Stat mimics File::Stat
# mostly accessed through Redisk::IO#stat
require 'time'

module Redisk
  class Stat
    extend Helper
    include Helper
    include Comparable
    
    attr_reader :name
    
    def initialize(name)
      @name = name
      write_default('atime', Time.now)
      write_default('ctime', Time.now)
      write_default('mtime', Time.now)
      write_default('size', 0)
    end
    
    # stat <=> other_stat => -1, 0, 1
    # Compares File::Stat objects by comparing their respective modification times.
    # 
    #    f1 = File.new("f1", "w")
    #    sleep 1
    #    f2 = File.new("f2", "w")
    #    f1.stat <=> f2.stat   #=> -1
    def <=>(other_stat)
      self.mtime <=> other_stat.mtime
    end
    
    # stat.atime => time
    # Returns the last access time for this file as an object of class Time.
    # 
    #    File.stat("testfile").atime   #=> Wed Dec 31 18:00:00 CST 1969
    def atime
      Time.parse(read_attribute('atime'))
    end
    
    # stat.blksize => integer or nil
    # Returns the native file system‘s block size. Will return nil on platforms that don‘t support this information.
    # 
    #    File.stat("testfile").blksize   #=> 4096
    def blksize
      0
    end
    
    # stat.blockdev? => true or false
    # Returns true if the file is a block device, false if it isn‘t or if the operating system doesn‘t support this feature.
    # 
    #    File.stat("testfile").blockdev?    #=> false
    #    File.stat("/dev/hda1").blockdev?   #=> true
    def blockdev?
      false
    end
    
    # stat.blocks => integer or nil
    # Returns the number of native file system blocks allocated for this file, or nil if the operating system doesn‘t support this feature.
    # 
    #    File.stat("testfile").blocks   #=> 2
    def blocks
      0
    end
    
    # stat.chardev? => true or false
    # Returns true if the file is a character device, false if it isn‘t or if the operating system doesn‘t support this feature.
    # 
    #    File.stat("/dev/tty").chardev?   #=> true
    def chardev?
      false
    end
    
    # stat.ctime → aTime
    # Returns the change time for stat (that is, the time directory information about the file was changed, not the file itself).
    # 
    #    File.stat("testfile").ctime   #=> Wed Apr 09 08:53:14 CDT 2003
    def ctime
      Time.parse(read_attribute('ctime'))
    end
      
    # stat.dev => fixnum
    # Returns an integer representing the device on which stat resides.
    # 
    #    File.stat("testfile").dev   #=> 774
    def dev
      nil
    end
    
    # stat.dev_major => fixnum
    # Returns the major part of File_Stat#dev or nil.
    # 
    #    File.stat("/dev/fd1").dev_major   #=> 2
    #    File.stat("/dev/tty").dev_major   #=> 5
    def dev_major
      0
    end
    
    # stat.dev_minor => fixnum
    # Returns the minor part of File_Stat#dev or nil.
    # 
    #    File.stat("/dev/fd1").dev_minor   #=> 1
    #    File.stat("/dev/tty").dev_minor   #=> 0
    def dev_minor
      0
    end
    
    # stat.directory? => true or false
    # Returns true if stat is a directory, false otherwise.
    # 
    #    File.stat("testfile").directory?   #=> false
    #    File.stat(".").directory?          #=> true
    def directory?
      false
    end
    
    # stat.executable? => true or false
    # Returns true if stat is executable or if the operating system doesn‘t distinguish executable files from nonexecutable files. The tests are made using the effective owner of the process.
    # 
    #    File.stat("testfile").executable?   #=> false
    def executable?
      false
    end
    
    # stat.executable_real? => true or false
    # Same as executable?, but tests using the real owner of the process.
    def executable_real?
      false
    end
    
    # stat.file? => true or false
    # Returns true if stat is a regular file (not a device file, pipe, socket, etc.).
    # 
    #    File.stat("testfile").file?   #=> true
    def file?
      false
    end
    
    # stat.ftype => string
    # Identifies the type of stat. The return string is one of: ``file’’, ``directory’’, ``characterSpecial’’, ``blockSpecial’’, ``fifo’’, ``link’’, ``socket’’, or ``unknown’’.
    # 
    #    File.stat("/dev/tty").ftype   #=> "characterSpecial"
    def ftype
      'unknown'
    end
    
    # stat.gid => fixnum
    # Returns the numeric group id of the owner of stat.
    # 
    #    File.stat("testfile").gid   #=> 500
    def gid
      Process.gid
    end
    
    # stat.grpowned? => true or false
    # Returns true if the effective group id of the process is the same as the group id of stat. On Windows NT, returns false.
    # 
    #    File.stat("testfile").grpowned?      #=> true
    #    File.stat("/etc/passwd").grpowned?   #=> false
    def grpowned?
      Process.grpowned?
    end
    
    # stat.ino => fixnum
    # Returns the inode number for stat.
    # 
    #    File.stat("testfile").ino   #=> 1083669
    def ino
      Process.ino
    end
    
    # stat.inspect => string
    # Produce a nicely formatted description of stat.
    # 
    #   File.stat("/etc/passwd").inspect
    #      #=> "#<File::Stat dev=0xe000005, ino=1078078, mode=0100644,
    #           nlink=1, uid=0, gid=0, rdev=0x0, size=1374, blksize=4096,
    #           blocks=8, atime=Wed Dec 10 10:16:12 CST 2003,
    #           mtime=Fri Sep 12 15:41:41 CDT 2003,
    #           ctime=Mon Oct 27 11:20:27 CST 2003>"
    def inspect
      "#<Redis::Stat (#{name}) atime=#{atime}, ctime=#{ctime}, mtime=#{mtime}, size=#{size}"
    end
    alias :to_s :inspect
    
    # stat.mode => fixnum
    # Returns an integer representing the permission bits of stat. The meaning of the bits is platform dependent; on Unix systems, see stat(2).
    # 
    #    File.chmod(0644, "testfile")   #=> 1
    #    s = File.stat("testfile")
    #    sprintf("%o", s.mode)          #=> "100644"
    def mode
      Process.mode
    end
    
    # stat.mtime → aTime
    # Returns the modification time of stat.
    # 
    #    File.stat("testfile").mtime   #=> Wed Apr 09 08:53:14 CDT 2003
    def mtime
      Time.parse(read_attribute('mtime'))
    end
    
    # stat.nlink => fixnum
    # Returns the number of hard links to stat.
    # 
    #    File.stat("testfile").nlink             #=> 1
    #    File.link("testfile", "testfile.bak")   #=> 0
    #    File.stat("testfile").nlink             #=> 2
    def nlink
      0
    end
    
    # stat.owned? => true or false
    # Returns true if the effective user id of the process is the same as the owner of stat.
    # 
    #    File.stat("testfile").owned?      #=> true
    #    File.stat("/etc/passwd").owned?   #=> false
    def owned?
      true
    end
      
    # stat.pipe? => true or false
    # Returns true if the operating system supports pipes and stat is a pipe; false otherwise.
    def pipe
      false
    end
    
    # stat.rdev => fixnum or nil
    # Returns an integer representing the device type on which stat resides. Returns nil if the operating system doesn‘t support this feature.
    # 
    #    File.stat("/dev/fd1").rdev   #=> 513
    #    File.stat("/dev/tty").rdev   #=> 1280
    def rdev
      0
    end
    
    # stat.rdev_major => fixnum
    # Returns the major part of File_Stat#rdev or nil.
    # 
    #    File.stat("/dev/fd1").rdev_major   #=> 2
    #    File.stat("/dev/tty").rdev_major   #=> 5
    def rdev_major
      0
    end
    
    # stat.rdev_minor => fixnum
    # Returns the minor part of File_Stat#rdev or nil.
    # 
    #    File.stat("/dev/fd1").rdev_minor   #=> 1
    #    File.stat("/dev/tty").rdev_minor   #=> 0
    def rdev_minor
      0
    end
    
    # stat.readable? => true or false
    # Returns true if stat is readable by the effective user id of this process.
    # 
    #    File.stat("testfile").readable?   #=> true
    def readable?
      true
    end
    
    # stat.readable_real? → true or false
    # Returns true if stat is readable by the real user id of this process.
    # 
    #    File.stat("testfile").readable_real?   #=> true
    def readable_real?
      true
    end
    
    # stat.setgid? => true or false
    # Returns true if stat has the set-group-id permission bit set, false if it doesn‘t or if the operating system doesn‘t support this feature.
    # 
    #    File.stat("/usr/sbin/lpc").setgid?   #=> true
    def setgid?
      Process.setgid?
    end
    
    # stat.setuid? => true or false
    # Returns true if stat has the set-user-id permission bit set, false if it doesn‘t or if the operating system doesn‘t support this feature.
    # 
    #    File.stat("/bin/su").setuid?   #=> true
    def setuid?
      Process.setuid?
    end
    
    # stat.size => fixnum
    # Returns the size of stat in bytes.
    # 
    #    File.stat("testfile").size   #=> 66
    def size
      read_attribute('size').to_i
    end
    
    # stat.socket? => true or false
    # Returns true if stat is a socket, false if it isn‘t or if the operating system doesn‘t support this feature.
    # 
    #    File.stat("testfile").socket?   #=> false
    def socket
      false
    end
    
    # stat.sticky? => true or false
    # Returns true if stat has its sticky bit set, false if it doesn‘t or if the operating system doesn‘t support this feature.
    # 
    #    File.stat("testfile").sticky?   #=> false
    def sticky
      false
    end
    
    # stat.symlink? => true or false
    # Returns true if stat is a symbolic link, false if it isn‘t or if the operating system doesn‘t support this feature. As File::stat automatically follows symbolic links, symlink? will always be false for an object returned by File::stat.
    # 
    #    File.symlink("testfile", "alink")   #=> 0
    #    File.stat("alink").symlink?         #=> false
    #    File.lstat("alink").symlink?        #=> true
    def symlink?
      false
    end
      
      
    # stat.uid => fixnum
    # Returns the numeric user id of the owner of stat.
    # 
    #    File.stat("testfile").uid   #=> 501
    def uid
      Process.uid
    end
    
    # stat.writable? → true or false
    # Returns true if stat is writable by the effective user id of this process.
    # 
    #    File.stat("testfile").writable?   #=> true
    def writable?
      true
    end
    
    # stat.writable_real? → true or false
    # Returns true if stat is writable by the real user id of this process.
    # 
    #    File.stat("testfile").writable_real?   #=> true
    def writable_real?
      true
    end
    
    # stat.zero? => true or false
    # Returns true if stat is a zero-length file; false otherwise.
    # 
    #    File.stat("testfile").zero?   #=> false
    def zero?
      size == 0
    end
    
    # redis specific
    
    # reads the attribute from Redis or returns nil
    def read_attribute(key)
      write_attribute('atime', Time.now)
      redis.get key_for_attribute(key)
    end
    
    # writes the attribute to redis as a string
    def write_attribute(key, value)
      redis.set key_for_attribute(key), value.to_s
      redis.set key_for_attribute('ctime'), Time.now
      value.to_s
    end
    
    # writes the default if this is the first time for this file
    def write_default(key, value)
      redis.setnx key_for_attribute(key), value.to_s
    end
    
    private
    def key_for_attribute(key)
      "#{name}:_stat:#{key}"
    end

  end
end
    
    