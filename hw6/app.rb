require 'rack'
require './CashMachine'

class App
  def initialize
    @cash = CashMachine.new
  end

  def call(env)
    req = Rack::Request.new(env)

    params = req.query_string.split('&').map { |pair| pair.split('=') }.to_h

    puts params

    case req.path
    when '/'
      [200, {'Content-Type' => 'text/html'}, File.readlines('./index.html')]
    when '/balance'
      result = @cash.balance
      [200, {'Content-Type' => 'text/html'}, ["<h1>#{result}</h1>"]]
    when '/deposit'
      result = @cash.deposit(params['value'].to_f)
      [200, {'Content-Type' => 'text/html'}, ["<h1>#{result}</h1>"]]
    when '/withdraw'
      result = @cash.withdraw(params['value'].to_f)
      [200, {'Content-Type' => 'text/html'}, ["<h1>#{result}</h1>"]]
    else
      [404, {'Content-Type' => 'text/html'}, ["404"]]
    end
  end
end
