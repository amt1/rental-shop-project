require_relative('../db/sql_runner.rb')

sql="INSERT INTO item_status_codes (meaning) VALUES ('In stock, available');"
SqlRunner.run(sql)
sql="INSERT INTO item_status_codes (meaning) VALUES ('Booked, unavailable');"
SqlRunner.run(sql)
sql="INSERT INTO item_status_codes (meaning) VALUES ('Booked, being altered');"
SqlRunner.run(sql)
sql="INSERT INTO item_status_codes (meaning) VALUES ('Out on loan');"
SqlRunner.run(sql)
sql="INSERT INTO item_status_codes (meaning) VALUES ('Returned, being cleaned');"
SqlRunner.run(sql)
sql="INSERT INTO item_status_codes (meaning) VALUES ('Returned, needs repair');"
SqlRunner.run(sql)
sql="INSERT INTO item_status_codes (meaning) VALUES ('Overdue');"
SqlRunner.run(sql)
sql="INSERT INTO item_status_codes (meaning) VALUES ('Written off as a loss');"
SqlRunner.run(sql)

sql="INSERT INTO theme_codes (theme_type, theme) VALUES ('Seasonal','Halloween');"
SqlRunner.run(sql)
sql="INSERT INTO theme_codes (theme_type, theme) VALUES ('Seasonal','Christmas');"
SqlRunner.run(sql)
sql="INSERT INTO theme_codes (theme_type, theme) VALUES ('Fandom','Star Wars');"
SqlRunner.run(sql)
sql="INSERT INTO theme_codes (theme_type, theme) VALUES ('Theatre','Peter Pan');"
SqlRunner.run(sql)
sql="INSERT INTO theme_codes (theme_type, theme) VALUES ('Fandom','Sci Fi');"
SqlRunner.run(sql)
sql="INSERT INTO theme_codes (theme_type, theme) VALUES ('Fandom','Star Trek');"
SqlRunner.run(sql)

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
