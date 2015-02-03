require 'rubygems'
require 'gems'

def search(gem_name)
  gem_info = Gems.info gem_name
  if gem_name == gem_info["name"]
    puts gem_info["info"]
    puts gem_info["gem_uri"]
  else
    puts "Gem does not exist. Try again."
  end
end

puts "Enter a gem name: "
gem_name = gets.chomp
search(gem_name)
