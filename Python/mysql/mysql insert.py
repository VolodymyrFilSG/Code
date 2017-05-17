import mysql.connector
conn = mysql.connector.connect(user='root', password='', host='localhost', database = 'test')
sql = "INSERT INTO `python_franshiza` (`Nick`, `E-mail`, `Pass`) VALUES (%s, %s, %s)"
cursor = conn.cursor()

f = open('accs.txt','r')
data = ''
for i in f:
    z = i.split(';')
    data = (z[0], z[1], z[2])
    cursor.execute(sql, data)
    conn.commit()
    print(z[0] + ',' + z[1] + ',' + z[2])
f.close()
cursor.close()
conn.close()
