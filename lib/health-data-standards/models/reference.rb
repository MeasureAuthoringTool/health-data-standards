class Reference
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic
  embedded_in :entry
  field :type, type: String
  field :referenced_type, type: String
  field :referenced_id

  def resolve_reference
    entry.record.entries.find do |e|
      e.class.to_s == referenced_type &&
      e.id == referenced_id
    end
  end
end