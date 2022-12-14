class CashMachine
  def initialize
    @balance = 100.0
  end

  def balance
    @balance
  end

  def deposit(value)
    if value.positive?
      @balance += value
    else
      'Ошибка, сумма меньше или равна нулю.'
    end
  end

  def withdraw(value)
    if value < @balance
      @balance -= value
    else
      'Сумма для вывода больше баланса.'
    end
  end
end

def init
  cs = CashMachine.new

  loop do
    puts ''
    puts 'Вы можете:'
    puts 'Внести деньги (D)'
    puts 'Вывести деньги (W)'
    puts 'Узнать баланс (B)'
    puts 'Выйти (Q)'
    puts ''

    case gets.chomp.downcase
    when 'b'
      puts "Ваш баланс - #{cs.balance}"
    when 'd'
      puts 'Внесите сумму для пополнения'
      cs.deposit(gets.chomp.to_f)

      puts "Ваш баланс - #{cs.balance}"
    when 'w'
      puts 'Внесите сумму для снятия'
      cs.withdraw(gets.chomp.to_f)

      puts "Ваш баланс - #{cs.balance}"
    when 'q'
      break
    end
  end
end
