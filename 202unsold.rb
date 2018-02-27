#!/usr/bin/env ruby

def print_help()
	puts "USAGE\n\t./202unsold a b\n\nDESCRIPTION\n\ta\tconstant computed from the past results"
	puts "\tb\tconstant computed from the past results"
end

ARGV.each do |a|
	if a == "-h"
		print_help()
		exit()
	end
end