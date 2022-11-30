def end_is_cs?(word)
  word.downcase[-2, 2] == 'cs' ? 2 ** word.size : word.reverse
end
