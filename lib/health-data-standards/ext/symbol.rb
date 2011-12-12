class Symbol
  # Will take the current symbol and append an "=" to the end of it.
  # So :bacon will become :bacon=. It is assumed that this would be
  # passed to Object#send to set the value of something
  def to_setter
    (self.to_s + '=').to_sym
  end
end