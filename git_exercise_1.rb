require 'rubygems'
require 'watir'
require 'pry'
require 'filter'

browser = Watir::Browser.new :chrome
browser.goto 'http://todomvc.com/examples/react/#/'

folder = "./people"

Dir.entries(folder).filter(/txt/).each{ |file_name|
	info = File.read("#{folder}/#{file_name}")
	id = info.split("\n")[0]
	name = info.split("\n")[1]
	last_name = info.split("\n")[2]
	discipline = info.split("\n")[3]
	hobbies = info.split("\n")[4].split(",")

	fail "#{name} you should have exactly 3 hobbies for this exercise :)" unless hobbies.size==3

	browser.text_field(:class => 'new-todo').set("Go with #{name.split(" ")[0]} to #{hobbies.sample.strip}")
	browser.text_field(:class => 'new-todo').send_keys :enter
}
