# Heather Dykstra
# September 11, 2013
# Lab 2 
# Michael Williams and I worked as a pair on this assignment
# This can also be found in https://github.com/slychika/saaslab2

#-----------------------------------------------------------------------

# Part1: Hello World
class HelloWorldClass
    def initialize(name)
       @name = name.capitalize
    end
    def sayHi
        puts "Hello #{@name}!"
    end
end

# Test Case 1:
#p "This is a test for Hello World"
hello = HelloWorldClass.new("Heather Dykstra")
hello.sayHi

#-----------------------------------------------------------------------

# Part 2 Strings
def palindrome?(string)
    string.downcase == string.downcase.reverse
end

def count_words(string)
    result = Hash.new(0)
	string.downcase.scan(/\w+/).map{|word| result[word] = string.downcase.scan(/\b#{word}\b/).size}
	return result
end

# Test Case 2:
#p "We will test 'mom' to see if it is a palindrome"
#p palindrome?("mom")

# Test Case 3:
#p "We will test 'word' to see if it is a palindrome"
#p palindrome?("word")

# Test Case 4:
#p "We will test 'this is a test' for number of words"
#p count_words("this is a test")

#-----------------------------------------------------------------------

# Part 3: Rock Paper Sissors
class WrongNumberOfPlayersError <  StandardError ; end
class NoSuchStrategyError <  StandardError ; end

def lose?(mine, his)
mine.upcase!; his.upcase!
strategies = ['R', 'P', 'S']
if(!strategies.include?(mine) or !strategies.include?(his))
raise NoSuchStrategyError
end
["RP", "PS", "SR"].include?(mine + his)
end

def rps_game_winner(game)
raise WrongNumberOfPlayersError unless game.length == 2
if(lose?(game[0][1], game[1][1]))
game[1]
else
game[0]
end
end

def rps_tournament_winner(game)
if(game[0][0].kind_of?(String))
rps_game_winner(game)
else
rps_game_winner [rps_tournament_winner(game[0]), rps_tournament_winner(game[1])]
end
end

# Test Case 5:
#p "This will test a basic tournament array. Richard should win"
#p rps_tournament_winner(
#[
#    [
#        [ ["Armando", "P"], ["Dave", "S"] ],
#        [ ["Richard", "R"],  ["Michael", "S"] ],
#    ],
#    [
#        [ ["Allen", "S"], ["Omer", "P"] ],
#        [ ["David E.", "R"], ["Richard X.", "P"] ]
#    ]
#]
#)

#-----------------------------------------------------------------------

# Part 4: Anagrams
def combine_anagrams(words)
     words.group_by{|w| w.downcase.chars.sort.to_s}.values
end

# Test Case 6:
#p "This should give you new arrays with lists of anagram words together"
#p combine_anagrams(['cars', 'for', 'hello', 'racs', 'four', 'flour', 
#'rain', 'niar'])

#-----------------------------------------------------------------------
