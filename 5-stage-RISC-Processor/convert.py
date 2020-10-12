file = open('test.txt', 'wb')
file.write('v2.0 raw\n')
with open('out.txt', 'r') as f:
	for line in f:
		line = line.split(':')[-1].strip()[2:]
		file.write(line + '\n')

file.write('90000000\n')
file.close()