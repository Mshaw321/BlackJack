
def dots
  dots = "..................."
  dots.each_char do |i|
    sleep(0.05)
    print i
  end
end

def bet
  p_money = 100
  #Temp money counter
  b_money = p_money
  loop do
    puts
    puts "The sum of your hand is: #{$p_sum}"
    puts
    print "How much will you bet? You have $#{p_money} >> "
    bet = gets.chomp.to_i
    puts
    b_money = b_money -= bet
    print "Your bet will leave you with $#{b_money}. Place bet? (y/n) >>  "
    confirm_bet = gets.chomp.downcase
    puts
    dots
    puts
    puts
    case confirm_bet
    when "y"
      p_money -= bet
      puts "Bet placed. You now have $#{p_money}."
      puts
      break
    when "n"
      puts "Let's try again."
      puts
    end
  end
end

def hit_me
  #logic to add a card to hand
  puts "You were dealt: #{$p_card_3[:rank]} of #{$p_card_3[:suit]}."
  $p_sum += $p_card_3_val.to_i
  puts
  puts "The sum of your hand is now: #{$p_sum}"
  puts
end

def face_card(x)
  case x[:rank]
  when "J"
    x[:rank] = 10
  when "K"
    x[:rank] = 10
  when "Q"
    x[:rank] = 10
  when "A"
    puts
    puts
    print "You have an Ace. You may choose its value (a) = 1 (b) = 11 >>>   "
    puts
    puts
    a_val = gets.chomp.downcase
    case a_val
    when "a"
      x[:rank] = 1
    when "b"
      x[:rank] = 11
    end
  end
end

def init_deal

  suits = %w(Clubs Diamonds Hearts Spades)
  ranks = %w(A 2 3 4 5 6 7 8 9 10 J K Q)

  w = rand(13)
  x = rand(4)
  y = rand(13)
  z = rand(4)
  q = rand(13)
  r = rand(4)

  w = ranks[w]
  x = suits[x]
  y = ranks[y]
  z = suits[z]
  q = ranks[q]
  r = suits[r]

  p_card_1 = {}
  p_card_2 = {}
  $p_card_3 = {}

  p_card_1[:rank] = w
  p_card_1[:suit] = x
  p_card_2[:rank] = y
  p_card_2[:suit] = z
  $p_card_3[:rank] = q
  $p_card_3[:suit] = r

  a = rand(12)
  b = rand(4)
  c = rand(12)
  d = rand(4)

  a = ranks[a]
  b = suits[b]
  c = ranks[c]
  d = suits[d]

  c_card_1 = {}
  $c_card_2 = {}

  c_card_1[:rank] = a
  c_card_1[:suit] = b
  $c_card_2[:rank] = c
  $c_card_2[:suit] = d

  puts
  puts "You were dealt: #{p_card_1[:rank]} of #{p_card_1[:suit]} and #{p_card_2[:rank]} of #{p_card_2[:suit]} "
  puts
  puts "Dealer was dealt: #{c_card_1[:rank]} of #{c_card_1[:suit]} and places the other card face down."
  puts

  face_card(p_card_1)
  face_card(p_card_2)
  face_card($p_card_3)

  p_card_1_val  = p_card_1[:rank]
  p_card_2_val  = p_card_2[:rank]
  $p_card_3_val = $p_card_3[:rank]
  c_card_1_val  = c_card_1[:rank]
  $c_card_2_val = $c_card_2[:rank]

  case c_card_1_val
  when "J"
    p_card_2_val = 10
  when "K"
    p_card_2_val = 10
  when "Q"
    p_card_2_val = 10
  end

  case $c_card_2_val
  when "J"
    $c_card_2_val = 10
  when "K"
    $c_card_2_val = 10
  when "Q"
    $c_card_2_val = 10
  end

  $p_sum = p_card_1_val.to_i + p_card_2_val.to_i
  $c_sum = c_card_1_val.to_i + $c_card_2_val.to_i
  #puts $c_sum
end
