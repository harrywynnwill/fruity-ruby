require 'fruitmachine'
require 'rules'

describe FruitMachine do
  subject(:fruitmachine) { FruitMachine.new bank, rules }
  let(:bank) {double("bank")}
  let(:rules) {double("rules")}

  describe "#insert_coin" do
    it "it interacts with the bank to begin the game" do
      allow(bank).to receive(:play_game).with(no_args)
      subject.insert_coin
      expect(bank).to have_received(:play_game).once
    end
  end
  describe "#spin_the_wheels" do
    it "spins the wheels on the fruity" do
      allow(fruitmachine.wheel).to receive(:sample).and_return(:blue)
      fruitmachine.spin_the_wheels
      expect(fruitmachine.player_turn).to eq [:blue, :blue, :blue, :blue]
    end
  end
  describe "#wheel_one_spin" do
    it "spins one wheel on the fruit machine" do
      allow(fruitmachine.wheel).to receive(:sample).and_return(:blue)
      fruitmachine.wheel_one_spin
      expect(fruitmachine.player_turn).to eq [:blue]
    end
  end
  describe "#result_of_spin" do
    it "determines the result of a spin on the fruitmachine" do
      allow(rules).to receive(:all_the_same_colour?)
      allow(rules).to receive(:two_or_more_adjacent_colours?)
      allow(rules).to receive(:all_different_colours?)
      allow(bank).to receive(:hit_the_jackpot)
      fruitmachine.result_of_spin
      expect(bank).to receive(:hit_the_jackpot)

      # expect(bank).to have_recieved(:payout_five_times)
      # expect(bank).to have_recieved(:payout_half)
    end
  end
end
