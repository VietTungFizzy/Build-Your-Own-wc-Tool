#!/usr/bin/env ruby

require "optparse"

parser = OptionParser.new

parser.on("-c [PATH_TO_FILE]", "Outputs the number of bytes in a file") do |path_to_file|
 size = path_to_file ? File.stat(path_to_file).size : $stdin.read.bytesize 
 print "#{size}\t#{path_to_file}\n"
end

parser.on("-l [PATH_TO_FILE]", "Outputs the number of lines in a file") do |path_to_file|
  count = 0
  if path_to_file
    File.open(path_to_file) do |file|
      file.each_line { |line| count += 1 }
    end
  else
    $stdin.each_line { |line| count += 1 }
  end
  print "#{count}\t#{path_to_file}\n"
end

parser.on("-w [PATH_TO_FILE]", "Outputs the number of words in a file") do |path_to_file|
  count = 0
  if path_to_file
    File.open(path_to_file) do |file|
      file.each_line do |line|
        count += line.split.size
      end
    end
  else
    $stdin.each_line { |line| count += line.split.size }
  end
  print "#{count}\t#{path_to_file}\n"
end

parser.on("-m [PATH_TO_FILE]", "Outputs the number of characters in a file") do |path_to_file|
  count = 0
  if path_to_file
    File.open(path_to_file) do |file|
      file.each_line do |line|
        count += line.size 
      end
    end
  else
    count = $stdin.read.size
  end
  print "#{count}\t#{path_to_file}\n"
end

parser.parse!

if ARGV.size == 1 && !%w(-w -l -m -c).include?(ARGV[0])
  path_to_file = ARGV[0]
  size = File.size(path_to_file)
  line_count = 0
  word_count = 0
  File.open(path_to_file) do |file|
    file.each_line do |line|
      line_count += 1
      word_count += line.split.size
    end
  end
  print "\t#{line_count}\t#{word_count}\t#{size} #{path_to_file}\n"
end


