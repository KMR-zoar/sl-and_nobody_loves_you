#!/usr/bin/env ruby
require 'json'

Source_Path = File.expand_path(File.dirname($0))
StringsFile = "#{Source_Path}/strings.json"
HistoryFile = "#{Source_Path}/history"

strings = open(StringsFile) do |file|
   JSON.load(file)
end

unless File::exist?(HistoryFile) 
   num = 0
   open(HistoryFile, 'w') do |file|
      file.write num
   end
end

num = open(HistoryFile) do |file|
   file.read.to_i
end

puts strings[num]

num += 1
num = 0 if num >= 4

open(HistoryFile, "w") do |file|
   file.write num
end
