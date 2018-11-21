require 'sinatra'
require 'sinatra/reloader'

random = rand(0..100)

get '/' do
  "The secret number is #{random}"
end
