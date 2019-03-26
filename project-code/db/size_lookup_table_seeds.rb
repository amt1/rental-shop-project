require_relative('../db/sql_runner.rb')

sql="INSERT INTO sizes (sizing, standard_size) VALUES ('Kids','Age 3-4');"
SqlRunner.run(sql)
sql="INSERT INTO sizes (sizing, standard_size) VALUES ('Kids','Age 5-6');"
SqlRunner.run(sql)
sql="INSERT INTO sizes (sizing, standard_size) VALUES ('Adult','L');"
SqlRunner.run(sql)
sql="INSERT INTO sizes (sizing, standard_size) VALUES ('Adult','XL');"
SqlRunner.run(sql)
sql="INSERT INTO sizes (sizing, standard_size) VALUES ('Women','12');"
SqlRunner.run(sql)
sql="INSERT INTO sizes (sizing, standard_size) VALUES ('Women','14');"
SqlRunner.run(sql)
sql="INSERT INTO sizes (sizing, standard_size) VALUES ('Women','16');"
SqlRunner.run(sql)
sql="INSERT INTO sizes (sizing, standard_size) VALUES ('Women','18');"
SqlRunner.run(sql)
sql="INSERT INTO sizes (sizing, standard_size) VALUES ('Men','32x32');"
SqlRunner.run(sql)
sql="INSERT INTO sizes (sizing, standard_size) VALUES ('Men','30x32');"
SqlRunner.run(sql)
