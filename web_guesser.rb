require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess, number)
  erb :index, :locals => { :number => number, :message => message }
end

def check_guess(guess, number)
  case
  when guess.to_i > number+5
    "Way too high!"
  when guess.to_i < number-5
    "Way too low!"
  when guess.to_i > number
    "Too high!"
  when guess.to_i < number
    "Too low!"
  else
    "You got it right!"
  end
end
