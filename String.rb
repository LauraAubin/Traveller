class String
  def string_between_markers(front, back)
    self[/#{Regexp.escape(front)}(.*?)#{Regexp.escape(back)}/m, 1]
  end

  def pluralize(value, string)
    if value > 1
      string + 's'
    else
      string
    end
  end
end
