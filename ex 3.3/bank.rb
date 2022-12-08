BALANCE = 'balance.txt'

File.open(BALANCE, 'w') { |f| f.write 100.0 } unless File.exists?(BALANCE)
loop do

  balance = File.read(BALANCE)
  balance = balance.to_f

  puts ''
  puts 'Вы можете:'
  puts 'Внести деньги (D)'
  puts 'Вывести деньги (W)'
  puts 'Узнать баланс (B)'
  puts 'Выйти (Q)'
  puts ''

  func = gets.chomp.to_s

  case func.capitalize
  when 'D'
    puts 'Внесите сумму для пополнения:'
    money = gets.chomp.to_f

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

    withdraw = gets.chomp.to_f

    if withdraw < balance || withdraw == balance
      sum = balance - withdraw
      File.open(BALANCE, 'w') { |f| f.write sum }

      puts '-' * 20
      puts "Вывод средств - #{withdraw}"
      puts '-' * 20
      puts "баланс - #{File.read(BALANCE)}"
      puts '-' * 20
    else
      puts 'Ошибка, сумма меньше или равна нулю'
    end

  when 'B'
    puts ''
    puts '-' * 20
    puts "баланс - #{File.read(BALANCE)}"
    puts '-' * 20
  when 'Q'
    break
  end

end
