class Rules

  def all_the_same_colour? turn
    turn.all? {|slot| slot == turn[0]}
  end

  def all_different_colours? turn
    turn.uniq.length == FruitMachine::SLOTS
  end

  def two_or_more_adjacent_colours? turn
    turn.each_cons(2).any? {|slot_a, slot_b| slot_a == slot_b }
  end

end
