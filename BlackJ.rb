
require "./bj_methods.rb"

puts
puts
puts "WELCOME TO BLACKJACK!"
puts
puts "---------------------"
puts
puts
print "What is your name? >>  "
name = gets.chomp
puts
puts "---------------------"
puts
puts
puts "Hello #{name}! Let's Play!"
puts
puts
puts "The dealer deals two cards to himself and to you."
puts
dots
puts

init_deal
bet

puts
print "Will you (S)tay or (H)it? >>  "
puts
puts
choice_1 = gets.chomp.downcase
puts
puts

case choice_1
when "h"
  hit_me
when "s"
end

puts
dots
puts
#insert logic for dealer to hit
puts
puts "The dealer flips over the hole card to show the #{$c_card_2[:rank]} of #{$c_card_2[:suit]}."
puts
puts "The dealer has: #{$c_sum}"
puts
puts "You have: #{$p_sum}"
puts0

#will dealer take hit
if $p_sum <= 21 && $p_sum > $c_sum && $c_sum != 21
  puts
  puts "You Win!"
  puts
elsif $p_sum > 21
  puts
  puts "Bust! You lose!"
  puts
end
