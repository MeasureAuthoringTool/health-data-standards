class CDAIdentifier
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :root, type: String
  field :extension, type: String
  embedded_in :cda_identifiable, polymorphic: true

  def ==(comparison_object)
    if comparison_object.respond_to?(:root) && comparison_object.respond_to?(:extension)
      self.root == comparison_object.root && self.extension == comparison_object.extension
    end
  end

  def hash
    "#{root}#{extension}".hash
  end
end