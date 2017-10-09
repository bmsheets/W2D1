# PHASE 2
def convert_to_int(str)
  begin
    int = Integer(str)
  rescue ArgumentError
    puts "Invalid input."
  ensure
    int
  end
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  else
    raise StandardError
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"

  begin
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue StandardError
    puts "Please choose from the following fruits."
    FRUITS.each do |fruit|
      print "#{fruit} "
    end
    retry
  end
end

# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    raise "Length of name needs to be greater than 0." if @name.size < 1
    @yrs_known = yrs_known
    raise "Years greater than 4 needs to be inputted." if @yrs_known < 5
    @fav_pastime = fav_pastime
    raise "Length of past time needs to be greater than 0." if @fav_pastime.size < 1
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
