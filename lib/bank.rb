class Bank

  FLOAT = 50
  COIN = 1
  FIVE = 5
  HALVE = 0.5
  NO_MONEY = "sorry the machine has no jackpot"
  DEFAULT_CREDIT = 20

  attr_reader :float, :jackpot, :gambler, :account

      DEFAULT_CREDIT = 20

  def initialize ammount = DEFAULT_CREDIT
    @account = ammount
    @float = FLOAT
    @jackpot = @float
  end

  def play_game coin = COIN
    debit coin
    add_to_jackpot coin
  end

  def payout_five_times coin = COIN
    5.times do
      if jackpot_empty?
         credit coin
      else
        credit coin
        remove_from_jackpot coin
      end
    end
  end

  def payout_half
    credit halve_jackpot
    remove_from_jackpot halve_jackpot
  end



  def hit_the_jackpot
    raise NO_MONEY if jackpot_empty?
    credit @jackpot
    remove_from_jackpot @jackpot
  end

  def add_to_jackpot coin
     @jackpot += coin
  end

  def remove_from_jackpot coin
    @jackpot -= coin
  end

  private

  def halve_jackpot
    (HALVE * @jackpot).round
  end

  def jackpot_empty?
    @jackpot == 0
  end

  def debit ammount
    @account -= ammount
  end

  def credit ammount
    @account += ammount
  end

end
