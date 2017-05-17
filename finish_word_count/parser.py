import wikipedia
import os

file = "0.txt"
f = open(file, 'r')
path = '/media/ogion/806C2B1C6C2B0C8A/_word/pages/' +  file.split('.')[0]
os.mkdir(path)
bad = open(path + "/bads.txt", 'a')
wikipedia.set_lang("uk")

while True:
	q = f.readline()
	if q:
		print(q)
		try:		
			conn = wikipedia.page(q)
			z = open(path + "//" + q)
			z.write(conn.content)
			z.close()
		except wikipedia.exceptions.DisambiguationError as e:
			print (e.options)
			bad.write(q)
			bad.write("\n")
		
	else:
		break

f.close()
bad.close()
