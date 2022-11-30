def EndIsCs?(word)
  word.downcase.reverse[0, 2] == 'cs' ? 2**word.size : word.reverse
end
