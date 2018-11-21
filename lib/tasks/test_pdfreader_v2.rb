require 'open-uri'
require 'pdf/reader'
require 'csv'
require 'date'
require 'holiday_jp'

io = open("lib/tasks/pdf/test.pdf")
reader = PDF::Reader.new(io)
puts reader.info

puts reader.pages.text
puts reader.objects
