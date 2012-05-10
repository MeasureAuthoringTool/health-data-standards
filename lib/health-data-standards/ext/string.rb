class String
  def to_boolean
    ['1', 'true', 't'].include?(self.downcase)
  end
end