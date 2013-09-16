module QRDA

  class Id
    include Mongoid::Document
    field :extension, type: String
    field :root, type: String
  end
end