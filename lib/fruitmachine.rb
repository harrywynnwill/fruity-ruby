require_relative 'rules'

class FruitMachine

  attr_reader :colours, :player_turn, :wheel, :bank

  WHEEL = [:red, :green, :blue, :yellow]
  SLOTS = 4

  def initialize bank = Bank.new, rules = Rules.new
    @bank = bank
    @player_turn = []
    @wheel = WHEEL
    @rules = rules
  end

  def self.create bank
    @fruity = FruitMachine.new(bank)
  end

  def self.instance
    @fruity
  end

  def spin_the_wheels
    clear_the_turn
    SLOTS.times { wheel_one_spin }
    player_turn
  end

  def insert_coin
    @bank.play_game
  end

  def show_balance
    @bank.account
  end

  def wheel_one_spin
    @player_turn << @wheel.sample
  end

  def result_of_spin
    return @bank.hit_the_jackpot if @rules.all_the_same_colour? @player_turn
    return @bank.payout_five_times if @rules.two_or_more_adjacent_colours? @player_turn
    return @bank.payout_half if @rules.all_different_colours? @player_turn
  end

  # result class

  private

  def clear_the_turn
    @player_turn = []
  end

end
