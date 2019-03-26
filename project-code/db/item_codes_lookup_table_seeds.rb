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
