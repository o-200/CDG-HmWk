BALANCE = 'balance.txt'

File.open(BALANCE, 'w') { |f| f.write 100.0 } unless File.exists?(BALANCE)
balance = File.read(BALANCE)
balance = balance.to_f

loop do
  puts ''
  puts 'Вы можете:'
  puts 'Внести деньги (D)'
  puts 'Вывести деньги (W)'
  puts 'Узнать баланс (B)'
  puts 'Выйти (Q)'

  func = gets.chomp.to_s

  case func.capitalize
  when 'D'
    puts 'Внесите сумму для пополнения:'
    money = gets.chomp.to_i

    if money > 0
      sum = balance + money
      File.open(BALANCE, 'w') { |f| f.write sum }

      puts "Ввод средств - #{money}"
      puts "баланс - #{File.read(BALANCE)}"
    else
      puts 'Ошибка, сумма меньше или равна нулю'
    end

  when 'W'
    puts 'Какую сумму вывести:'

    money = gets.chomp.to_i

    if money > 0
      sum = balance - money
      File.open(BALANCE, 'w') { |f| f.write sum }

      puts "Вывод средств - #{money}"
      puts "баланс - #{File.read(BALANCE)}"
    else
      puts 'Ошибка, сумма меньше или равна нулю'
    end

  when 'B'
    puts '--------------------'
    puts "баланс - #{File.read(BALANCE)}"
    puts '--------------------'
  when 'Q'
    break
  end
end
