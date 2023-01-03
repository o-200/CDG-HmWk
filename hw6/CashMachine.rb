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
      raise 'Ошибка, сумма меньше или равна нулю.'
    end
  end

  def withdraw(value)
    if value < @balance && !value.negative?
      @balance -= value
    else
      raise 'Ошибка. Сумма для вывода больше баланса или отрицательная'
    end
  end
end
