require 'rack'
require 'pry'

require './CashMachine'

class App
  def call(env)
    req = Rack::Request.new(env)

    params = req.query_string.split('&').map { |pair| pair.split('=') }.to_h

    puts params

    case req.path
    when '/'
      [200, {'Content-Type' => 'text/html'}, File.readlines('./index.html')]
    when '/cashmachine'
      result = CashMachine_controller(params)
      [200, {'Content-Type' => 'text/html'}, ["<h1>#{result}</h1>"]]
    else
      [404, {'Content-Type' => 'text/html'}, ["404"]]
    end
  end

  def CashMachine_controller(params)
    cash = CashMachine.new(params['value'].to_i)

    case params['operation']
    when 'deposit'
      cash.deposit
    when 'withdraw'
      cash.withdraw
    end

    "Balance: #{cash.balance}"
  end
end
