require 'sinatra'
require 'sinatra/reloader'

NUMBER = rand(100)

def check_guess(string_num)
  if string_num.to_i < NUMBER && (string_num.to_i - NUMBER).abs > 5
    "Way too low!"
  elsif string_num.to_i > NUMBER && (string_num.to_i - NUMBER).abs > 5
    "Way too high!"
  elsif string_num.to_i < NUMBER
    "Too low!"
  elsif string_num.to_i > NUMBER
    "Too high!"
  elsif string_num.to_i == NUMBER
    "You got it right! The secret number is #{NUMBER}"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => NUMBER, :message => message}
end
