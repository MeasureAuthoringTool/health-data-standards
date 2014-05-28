module Metadata
  class LinkInfo
    include Mongoid::Document

    field :href, type: String
    field :extension, type: String
    field :uri, type: String

  end
end