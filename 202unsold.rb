#!/usr/bin/env ruby

def is_numeric(o)
	true if Integer(o) rescue false
end

def print_help()
	if ARGV.length == 0
		exit(84)
	end
	if ARGV[0] == "-h"
		puts "USAGE\n\t./202unsold a b\n\nDESCRIPTION"
		puts "\ta\tconstant computed from the past results"
		puts "\tb\tconstant computed from the past results"
		exit()
	end
end

def printDash()
	i = 0
	while i < 60
		print "-"
		i += 1
	end
	STDOUT.flush
	print "\n"
end

def calculUnsold(a, b, x, y)
	return ((a - x)*(b - y))/((5*a - 150)*(5*b - 150))
end

def displayZvalue()
	z = 20
	print "z\t"
	while z <= 100
		print "%d\t" % z
		z += 10
	end
	print "total\np(Z=z)\t"
	z = 20
	while z <= 100
		print "12\t"
		z += 10
	end
	puts "1"
	printDash()
end

def displayTable(table)
	printDash()
	puts "\tX=10\tX=20\tX=30\tX=40\tX=50\tY law"
	y = 1
	for arr in table
		x = 1
		if y == table.length
			print "X law\t"
		else
			print "Y=#{y*10}\t"
		end
		for el in arr
			if x == arr.length and y == table.length
				print "1"
			else
				print "%.3f\t" % el
			end
			x += 1
		end
		puts
		y+= 1
	end
	printDash()
end

def getLawY(table)
	x = 0
	while x < table.length
		y = 0
		res = 0.0
		while y < table[x].length
			res += table[y][x]
			y += 1
		end
		table[y-1][x] = res
		x += 1
	end
	return table
end

def myUnsold(a, b)
	
	table = Array.new(6) {Array.new(6, 0)}
	y = 0
	while y < 5
		law_x = 0
		x = 0
		while x < 5
			val = calculUnsold(a, b, (x+1)*10, (y+1)*10)
			law_x += val
			table[y][x] = val
			x+=1
		end
		table[y][x] = law_x
		y+=1
	end
	y=0
	table = getLawY(table)
	displayTable(table)
end

def main()
	print_help()
	if ARGV.length != 2
		puts "Error: bad number of arguments"
		exit(84)
	end
	a = is_numeric(ARGV[0]) ? Float(ARGV[0]) : nil
	b = is_numeric(ARGV[1]) ? Float(ARGV[1]) : nil
	if a == nil or b == nil
		puts "Error: arguments must be valid number"
		exit(84)
	end
	if (a <= 50 or b <= 50)
		puts "Error: a and b must be greater than 50"
		exit(84)
	end
	myUnsold(a, b)
end

if __FILE__ == $0
	main()
end