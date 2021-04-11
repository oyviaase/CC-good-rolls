#!/bin/env ruby

# A little script to remove duplicate lines in a file without resorting it

#dimwishlist:

rollWritten = Array.new
puts "Read CC-curated"
File.readlines('CC-curated').each do |line|
  if line.match('^dimwishlist:')
    # Check that the line has not currently been written
    if not rollWritten.include?(line)
      rollWritten.push(line)
      puts line
    end
  # Write any line containing a comment or whitespace
  else 
    puts line
  end
end
