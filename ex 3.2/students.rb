STUDENTS = 'students.txt'
RESULTS = 'results.txt'
results = File.open(RESULTS, 'a')

loop do
  puts "Укажите возраст, который нужно найти"
  age = gets.chomp.to_i

  if age != -1
    File.foreach(STUDENTS) do |n|
      if n.include?(age.to_s)
        results.puts(n)
      end
    end
  else
    File.foreach(RESULTS) { |n| puts n }
    break
  end
end

