require 'rubygems'
require 'watir'
require 'pry'
require 'filter'

browser = Watir::Browser.new :chrome
browser.goto 'http://todomvc.com/examples/react/#/'

file_name = "people.txt"

info = File.read("#{file_name}")

(info.split("\n").size/6).times do |person_index|
	line_index = person_index * 6
	fail "Entry ##{person_index+1} should start with '>>>>>>>>>>' for this exercise :)" unless info.split("\n")[line_index]==">>>>>>>>>>"
	id = info.split("\n")[line_index+1]
	name = info.split("\n")[line_index+2]
	last_name = info.split("\n")[line_index+3]
	discipline = info.split("\n")[line_index+4]
	hobbies = info.split("\n")[line_index+5].split(",")

	fail "#{name} you should have exactly 3 hobbies for this exercise :)" unless hobbies.size==3

	browser.text_field(:class => 'new-todo').set("Go with #{name.split(" ")[0]} to #{hobbies.sample.strip}")		
	browser.text_field(:class => 'new-todo').send_keys :enter
end

binding.pry

