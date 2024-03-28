import mysql.connector

host = 'localhost'
user = 'youruser'
password = 'yourpassword'
database = 'yourdatabase'

conexao = mysql.connector.connect(
    host=host,
    user=user,
    password=password,
    database=database
)

cursor = conexao.cursor()
# Realizando um consulta no database / table cliente:
consulta_cliente = 'SELECT * FROM cliente'
cursor.execute(consulta_cliente)

resultado = cursor.fetchall()

for linha in resultado:
    print(linha)

cursor.close()
conexao.close()