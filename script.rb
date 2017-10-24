#!/usr/bin/env ruby

require 'octokit'
require 'optparse'

options = {}

OptionParser.new do |parser|
    parser.banner = "Usage: gh-new REPO [OPTIONS]"

    parser.on('-u', '--username USERNAME', '--uname USERNAME', '--login USERNAME', 'Github Username.') do |username|
        options[:login] = username
    end

    parser.on('-p', '--password PASSWORD', '--pword PASSWORD', 'Github Password.') do |password|
        options[:password] = password
    end

    parser.on_tail("-h", "--help", "--usage", "Show this usage message and quit.") do |help|
        puts parser.help
        exit
    end
end.parse!

options[:repo] = ARGV.pop # TODO add to OptionParser somehow?
if options[:repo].nil?
    puts "Usage: gh-new REPO [OPTIONS]"
    exit
end

print "Create repository with name \"#{options[:repo]}\"? (y/n): "
conf = gets.chomp.downcase
unless conf == "y" || conf == "yes"
    puts "Cancelled."
    exit
end

if options[:login].nil?
    print "Username: "
    options[:login] = gets.chomp
end

if options[:password].nil?
    print "Password: "
    options[:password] = gets.chomp
end

# TODO catch exception

# TODO read git credentials

client = Octokit::Client.new(options)

client.create_repository(options[:repo])

puts "Done!"

# TODO clone locally
