import mysql.connector
conn = mysql.connector.connect(user='root', password='12345', host='localhost', database = 'test')
sql = "INSERT INTO `units`(`ID`, `Name`) VALUES ('4','fuck')"
cursor = conn.cursor()
cursor.execute(sql)
conn.commit()
cursor.close()
conn.close()
