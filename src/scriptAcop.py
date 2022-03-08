#!/usr/bin/python
import sys

operations = [
    (32, 'DISCOVERY', 'i'),
    (16, 'NOTIFY', 'n'),
    ( 8, 'DELETE', 'd'),
    ( 4, 'UPDATE', 'u'),
    ( 2, 'RETRIEVE', 'r'),
    ( 1, 'CREATE', 'c')
]

def bitfield(n, length = 6):
    r = [int(digit) for digit in bin(n)[2:]]
    while len(r) < length:
        r.insert(0, 0)
    return r


def opsBitfield(field):
    sm = []
    for i in range(len(field)-1, -1, -1):
        if field[i]:
            sm.append(operations[i][1])
    return ', '.join(sm)


def toBitfield(query):
	r = []
	for each in query.lower():
		for op in operations:
			if each == op[2]:
				if op[0] not in r:
					r.append(op[0])
				break # break for if found
		else:
			return -1 # return error if for did not exit

	return sum(r)


def error():
	print('<items><item>')
	print('<title>Access Control Operations</title>')
	print('<subtitle>"acop" must be a number between 1 and 63 OR one of "crudni"</subtitle>')
	print('</item></items>')



qu = sys.argv[1]
try:
	query = int(qu)

except ValueError:
	# Not a number, so try to calculate the reverse
	result = toBitfield(qu)
	if result > 0:
		result = str(result)
		print('<items><item arg="' + result + '">')
		#print('<title>Access Control Operations</title>')
		print('<title>' + qu + ' = ' + result + '</title>')
		print('<text type="copy">' + result + '</text>')
		print('<text type="largetype">' + result + '</text>')
		print('</item></items>')

	else:
		error()

else:
	# If no exception, ie. query is an integer
	if 0 < query < 64:
		result = 'ALL' if query == 63 else opsBitfield(bitfield(query))
		print('<items><item arg="' + result + '">')
		#print('<title>Access Control Operations</title>')
		print('<title>' + qu + ' = ' + result + '</title>')
		print('<text type="copy">' + result + '</text>')
		print('<text type="largetype">' + result + '</text>')
		print('</item></items>')
	else:
		error()


