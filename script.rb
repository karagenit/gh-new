#!/usr/bin/env ruby

require 'octokit'

name = ARGV.pop

# TODO read args for create_repository options

if name.nil?
    puts "Usage: gh-new [REPO]"
    exit
end

puts "Make Repo with name #{name}?"
conf = gets.chomp.downcase
unless conf == "y" || conf == "yes"
    puts "Cancelled."
    exit
end

print "Username: "
uname = gets.chomp
print "Password: "
pword = gets.chomp

# TODO catch exception

# TODO read git credentials

client = Octokit::Client.new(:login => uname, :password => pword)

client.create_repository(name)

puts "Done!"

# TODO clone locally
