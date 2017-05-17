import mysql.connector
conn = mysql.connector.connect(user='root', password='12345', host='localhost', database = 'test')
sql = "UPDATE `units` SET `ID`=5,`Name`='die motherfucker' WHERE id = 4"
cursor = conn.cursor()
cursor.execute(sql)
conn.commit()
cursor.close()
conn.close()
