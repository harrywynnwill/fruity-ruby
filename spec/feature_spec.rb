require 'fruitmachine'
require 'bank'

describe "FEATURE TESTS" do
  let(:fruity) {FruitMachine.new}
  it "player recieves the jackpot get 4 colours in a row" do
    fruity.insert_coin
    allow(fruity.wheel).to receive(:sample).and_return(:blue)
    fruity.spin_the_wheels
    fruity.result_of_spin
    expect(fruity.bank.jackpot).to eq 0
    expect(fruity.show_balance).to eq 70
  end
  it "player recieves 1/2 the jackpot for all different colours" do

    fruity.insert_coin
    allow(fruity.wheel).to receive(:sample).and_return(:blue)
    fruity.wheel_one_spin
    allow(fruity.wheel).to receive(:sample).and_return(:green)
    fruity.wheel_one_spin
    allow(fruity.wheel).to receive(:sample).and_return(:red)
    fruity.wheel_one_spin
    allow(fruity.wheel).to receive(:sample).and_return(:yellow)
    fruity.wheel_one_spin
    fruity.result_of_spin
    expect(fruity.bank.jackpot).to eq 25
    expect(fruity.show_balance).to eq 45
  end
  it "pays out 5 times the stake for 2 of the same adjacent colours" do
    fruity.insert_coin
    allow(fruity.wheel).to receive(:sample).and_return(:blue)
    fruity.wheel_one_spin
    allow(fruity.wheel).to receive(:sample).and_return(:green)
    fruity.wheel_one_spin
    allow(fruity.wheel).to receive(:sample).and_return(:green)
    fruity.wheel_one_spin
    allow(fruity.wheel).to receive(:sample).and_return(:yellow)
    fruity.wheel_one_spin
    fruity.result_of_spin
    expect(fruity.bank.jackpot).to eq 46
    expect(fruity.show_balance).to eq 24
  end
  it "gives the gambler credits if there is not enough money in the machine to play" do
    fruity.insert_coin
    allow(fruity.wheel).to receive(:sample).and_return(:blue)
    fruity.wheel_one_spin
    allow(fruity.wheel).to receive(:sample).and_return(:green)
    fruity.wheel_one_spin
    allow(fruity.wheel).to receive(:sample).and_return(:green)
    fruity.wheel_one_spin
    allow(fruity.wheel).to receive(:sample).and_return(:yellow)
    fruity.wheel_one_spin
    fruity.bank.remove_from_jackpot 48
    fruity.result_of_spin
    expect(fruity.bank.jackpot).to eq 0
    expect(fruity.show_balance).to eq 24
  end
end
