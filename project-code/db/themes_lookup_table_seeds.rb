require_relative('../db/sql_runner.rb')

sql="INSERT INTO theme_codes (theme_type, theme) VALUES ('Seasonal','Halloween');"
SqlRunner.run(sql)
sql="INSERT INTO theme_codes (theme_type, theme) VALUES ('Seasonal','Christmas');"
SqlRunner.run(sql)
sql="INSERT INTO theme_codes (theme_type, theme) VALUES ('Fandom','Star Wars');"
SqlRunner.run(sql)
sql="INSERT INTO theme_codes (theme_type, theme) VALUES ('Theatre','Peter Pan');"
SqlRunner.run(sql)
