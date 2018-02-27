#!/usr/bin/env ruby

def print_help()
	puts "USAGE\n\t./202unsold a b\n\nDESCRIPTION\n\ta\tconstant computed from the past results"
	puts "\tb\tconstant computed from the past results"
	exit()
end

def printDash()
	i = 0
	while i < 55
		print "-"
		i += 1
	end
	STDOUT.flush
	print "\n"
end

def calculUnsold(a, b, x, y)
	return ((a - x)*(b - y))/((5*a - 150)*(5*b - 150))
end

def printXline()
	puts "\tX=10\tX=20\tX=30\tX=40\tX=50\tY law"
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

def myUnsold(a, b)
	
	printDash()
	printXline()

	arr = Array.new(5, 0)
	y = 10
	law_y = 0
	while y <= 50
		law_x = 0
		x = 10
		print "Y=#{y}\t"
		while x <= 50
			print "%.3f\t" % calculUnsold(a, b, x, y)
			law_x += calculUnsold(a, b, x, y)
			arr[x/10-1] += calculUnsold(a,b,x,y)
			x+=10
		end
		print "%.3f\n" % law_x
		y+=10
	end
	y=0
	print "X law\t"
	while y < 5
		print "%.3f\t" % arr[y]
		y+=1
	end
	puts "1"
	printDash()
	displayZvalue()
end

def main()
	if ARGV[0] == "-h"
		print_help()
	end
	a = Float(ARGV[0])
	b = Float(ARGV[1])
	if (a <= 50 or b <= 50)
		puts "Error: a and b must be greater than 50"
		exit(84)
	end
	myUnsold(a, b)
end

if __FILE__ == $0
	main()
end