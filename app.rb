require 'sinatra/base'
require_relative './lib/bank'
require_relative './lib/fruitmachine'

class Fruity < Sinatra::Base
  enable :sessions

  get '/' do
    erb :credit_form
  end

  get '/play' do
    @fruity = FruitMachine.instance
    @funds = @fruity.show_balance
    @fruity.insert_coin
    @player_turn = @fruity.player_turn
    @fruity.spin_the_wheels
    @fruity.result_of_spin
    erb :play
  end

  post '/credit' do
    bank = Bank.new(params[:credit].to_i)
    @fruity = FruitMachine.create(bank)
    redirect '/play'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
