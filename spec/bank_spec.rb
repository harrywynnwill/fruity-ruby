require 'bank'
describe Bank do
  subject(:bank) { Bank.new }
  let(:float) { 50 }
  let(:half_jackpot) {-bank.jackpot/2}
  let(:coin) {1}
  let(:five_coins) {5*coin}

  it "initializes with a float" do
    expect(bank.float).to eq float
  end
  describe "#play_game" do
    it "adds a coin to the jackpot" do
      expect{ bank.play_game }.to change { bank.jackpot }.by coin
      expect(bank.jackpot).not_to eq 0
    end
  end
  describe "#payout_five_times" do
    it "pays out five times the stake from the jackpot" do
      expect{ bank.payout_five_times }.to change {bank.jackpot}.by -five_coins
      expect(bank.jackpot).not_to eq 1
    end
  end
  describe "#payout_half" do
    it "pays out halve the jackpot" do
      expect{bank.payout_half}.to change {bank.jackpot}.by half_jackpot
    end
  end
  describe "#hit_the_jackpot" do
    it "pays out the jackpot" do
      bank.hit_the_jackpot
      expect(bank.jackpot).to eq 0
    end
  end
  describe "#add_to_jackpot" do
    it "adds coins to the jackpot" do
      bank.add_to_jackpot 5
      expect(bank.jackpot).to eq 55
    end
  end
  describe "#remove_from_jackpot" do
    it "removes coins from the jackpot" do
      bank.remove_from_jackpot 5
      expect(bank.jackpot).to eq 45
    end
  end
end
