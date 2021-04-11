#!/bin/env ruby 

# A little script to get the perksID and itemID from destinytracker-url

# Format of the destinytracker URL that I want to parse
#URL_FORMAT = /(?<url>'^https:\/\/destinytracker.com\/destiny-2\/db\/items\/')/ #)([0-9]*-[\w]*)
URL_FORMAT = /(?<url>^https:\/\/destinytracker.com\/destiny-2\/db\/items\/)(?<itemid>\d*)(?<itemname>[\-\w\-]*)\?perks=(?<perks>[\w,]*)/

def parseFile(fname)
  #puts "Read " + fname
  File.readlines(fname).each do |line|
    # Check that the line starts with the URL
    if line.match('^https\:\/\/destinytracker.com\/destiny-2\/db\/items\/')
      field = line.match(URL_FORMAT)
      allPerks = field[:perks].split(',')
      #puts allPerks
      usefullPerks = allPerks[1] + ',' + allPerks[2] + ',' + allPerks[3] + ',' + allPerks[4]
      puts "dimwishlist:item=" + field[:itemid].to_s + "&perks=" + usefullPerks
    else
      # Print out comments etc.
      puts line
    end
  end
end

# If the script is run with the filename as input use that
if ARGV.length == 1
  parseFile(ARGV[0])
end
