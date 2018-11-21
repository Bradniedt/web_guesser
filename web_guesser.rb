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

def color_checker(result)
  if (result == "Way too low!") || (result == "Way too high!")
    "#7f0303"
  elsif (result == "Too low!") || (result == "Too high!")
    "#f29d9d"
  else
    "#429b36"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  color = color_checker(message)
  erb :index, :locals => {:number => NUMBER, :color => color, :message => message}
end
