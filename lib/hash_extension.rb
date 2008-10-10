class Hash
  def stringify_all_keys!
    self.stringify_keys! && self.each_value{|value| value.stringify_all_keys! if value.is_a?(Hash)}
  end
end