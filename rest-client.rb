
require 'rvm'
require 'rest-client'

puts "What would you like to search for?"
input = gets.chomp

results = RestClient.get "https://www.google.com/search?q=#{input}"
puts results