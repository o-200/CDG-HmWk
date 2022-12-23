require 'rspec'
require_relative 'CashMachine'

RSpec.describe CashMachine do
  let(:value) { 25 }

  describe '#deposit' do
    context 'when operation is right' do
      it 'value is a correct' do
        expect(subject.deposit(value)).to eq 125.0
      end
    end

    context 'when operation is wrong' do
      it 'value is negative' do
        expect { subject.deposit(-1) }.to raise_error('Ошибка, сумма меньше или равна нулю.')
      end
    end
  end

  describe '#withdraw' do
    context 'when operation is right' do
      it 'value is a correct' do
        expect(subject.withdraw(value)).to eq 75.0
      end
    end

    context 'when operation is wrong' do
      it 'value is negative' do
        expect { subject.withdraw(-1) }.to raise_error('Ошибка. Сумма для вывода больше баланса или отрицательная')
      end

      it 'value > balance' do
        expect { subject.withdraw(1000) }.to raise_error('Ошибка. Сумма для вывода больше баланса или отрицательная')
      end
    end
  end
end
