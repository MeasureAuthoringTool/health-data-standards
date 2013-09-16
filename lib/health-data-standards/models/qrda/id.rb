module Qrda

  class Id
    include Mongoid::Document
    field :extension, type: String
    field :root, type: String

    def self.generate(root=nil, extension=nil)
      root ||= ""
      extension ||= ""
      return self.new(root: root, extension: extension)
    end


  end
end