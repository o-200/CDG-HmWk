require 'rspec'
require_relative 'CashMachine'

RSpec.describe CashMachine do
  let(:value) { 25 }

  describe '#deposit' do
    it 'should be a correct deposit' do
      expect(subject.deposit(value)).to eq 125.0
    end

    it 'should be a wrong deposit' do
      expect { subject.deposit(-1) }.to raise_error('Ошибка, сумма меньше или равна нулю.')
    end
  end

  describe '#withdraw' do
    it 'should be a correct withdraw' do
      expect(subject.withdraw(value)).to eq 75.0
    end

    it 'should be a wrong withdraw with negative value' do
      expect { subject.withdraw(-1) }.to raise_error('Ошибка. Сумма для вывода больше баланса или отрицательная')
    end

    it 'should be a wrong withdraw with value > balance' do
      expect { subject.withdraw(1000000) }.to raise_error('Ошибка. Сумма для вывода больше баланса или отрицательная')
    end
  end
end
