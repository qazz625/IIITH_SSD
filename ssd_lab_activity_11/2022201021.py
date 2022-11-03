from collections import defaultdict
import csv

f = open("lab_11_data.csv", 'r')
wr = open("avg_output.txt", "w")

d = defaultdict(int)

headings = []
data = []
with f as csv_file:
	csv_reader = csv.reader(csv_file, delimiter=',')
	line_count = 0
	for row in csv_reader:
		if line_count == 0:
			headings = row
			# print(f'Column names are {", ".join(row)}')
			line_count += 1
		else:
			# print(row)
			# print(f'\t{row[0]} works in the {row[1]} department, and was born in {row[2]}.')
			line_count += 1
		data += [row]
	# print(f'Processed {line_count} lines.')

counter = 0
for x in headings:
	d[x] = counter
	counter += 1


newdata = data[:][:]
# print(newdata)
for i in range(len(data)):
	for j in range(6):
		newdata[i].pop()

# print(newdata)

with wr as csvfile:
	csvwriter = csv.writer(csvfile) 
	for x in newdata:
		# print(x)
		csvwriter.writerow(x)


wr = open("avg_output.txt", "w")

newnewdata = [newdata[0]]

# lol = 0
# for x in data[1:]:
# 	if float(x[d['% Chng']]) > -3:
# 		print(lol)
# 		lol += 1
	# print(x[d['% Chng']])

# print(newdata[1:])
temp = filter(lambda x: float(x[d['% Chng']]) > -3, newdata[1:])
for x in temp:
	# print(x)
	newnewdata += [x]

# for x in newnewdata:
# 	print(x);

newdata = newnewdata[:][:]
new_linecount = 0
with wr as csvfile:
	csvwriter = csv.writer(csvfile) 
	for x in newdata:
		csvwriter.writerow(x)
		new_linecount += 1


newnewdata = [newdata[0]]

temp1 = list(map(lambda x: float(x[d['Open']].replace(',', '')), newdata[1:]))
temp2 = list(map(lambda x: float(x[d['High']].replace(',', '')), newdata[1:]))
temp3 = list(map(lambda x: float(x[d['Low']].replace(',', '')), newdata[1:]))


ans = [sum(temp1)/len(temp1), sum(temp2)/len(temp2), sum(temp3)/len(temp3)]
wr = open("avg_output.txt", "w")

# print(ans)
for x in ans:
	wr.write(str(x)+"\n")


alphabets = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
ch = input()
wr = open("stock_output.txt", "w")

if len(ch) > 1 or (ch not in alphabets):
	print("INVALID INPUT")
	exit()

ch = ch.upper()
# print(ch)

# print(data)
newdata = list(filter(lambda x: x[d['Symbol']][0].upper() == ch, newdata[1:]))
# print(newdata)

for x in newdata:
	for y in x:
		wr.write(y+" ")
	wr.write("\n")

wr.close()



