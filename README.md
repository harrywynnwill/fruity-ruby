[![Coverage Status](https://coveralls.io/repos/github/harrywynnwill/pairing-tests/badge.svg?branch=master)](https://coveralls.io/github/harrywynnwill/pairing-tests?branch=master)

refactor rules from module to class
gambler can go to bank

# Fruit machine

We are going to create a virtual fruit machine. To make things easier instead of symbols we are going to use colours: black, white, green, yellow.

Each time a player plays our fruit machine we display four 'slots' each with a randomly selected colour in each slot.

If the colours in each slot are the same then the player wins the jackpot which is all of the money that is currently in the machine.

Implement a basic machine, along with the concept of a player who has a fixed amount of money to play the machine.

## Floats and prizes

We are now going to add a "float" to our fruit machine, this is an initial sum of money that the machine has. In addition we are going to implement a prize system.

If each slot has a different colour then the machine should pay out half the current money in the machine.

If a given play results in two or more adjacent slots containing the same colour then the machine should pay out a prize of 5 times the cost of a single play.

If the machine does not have enough money to pay a prize it should credit the player with a number of free plays equal to the difference between the full prize and the amount of money available. This does not affect a jackpot win.


As a gambler
So that I can determine what I have won
I would like to have 4 colours on the fruit machine

As a gambler
so that I can gamble
I would like the fruit machine to randomly display 4 colours

As a gambler
so that I can win the jackpot
I would like to win all the money in the machine if I match 4 colours in a row

As a gambler
so that I don't hemorrhage infinite money into the machine
I would like a set amount to gamble with

As a gambler
so that I am enticed to play
I would like the machine to have a "float"

As a gambler
So that i'm stimulated and enticed to gamble more
I would like the machine to payout 1/2 the jackpot for 4 different colours
I would like the machine to payout 5 times the cost of a single play if 2 or more adjacent slots have the same colours

As a gambler
So that I dont feel ripped off
the machine should credit the player with free plays equal to the difference between the full prize and money available. this does not effect the jackpot win.
# fruity-ruby
