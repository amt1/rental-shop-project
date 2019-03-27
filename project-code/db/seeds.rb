require_relative('../db/sql_runner.rb')
require_relative('../models/stock_item.rb')
#
@costume1 = {
  'name' => 'Baby Yoda',
  'size' => '1',
  'measurements' => 'Standard Size',
  'cleaning_instructions' => 'Delicate Wash at 30, No Spin, No Tumble Dry',
  'status' => '1',
  'colour' => 'White',
  'price' => 10
}
@baby_yoda = StockItem.new(@costume1)
@costume2 = {
  'name' => 'Ensign Redshirt',
  'size' => '1',
  'measurements' => 'Standard Size',
  'cleaning_instructions' => 'Delicate Wash at 30, No Spin, No Tumble Dry',
  'status' => '1',
  'colour' => 'Red',
  'price' => 5
}
@redshirt = StockItem.new(@costume2)

#
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

@baby_yoda.save
@redshirt.save

sql="INSERT INTO item_themes (theme_code, item_id) VALUES ('3',$1);"
values=[@baby_yoda.id]
SqlRunner.run(sql,values)
sql="INSERT INTO item_themes (theme_code, item_id) VALUES ('5',$1);"
values=[@baby_yoda.id]
SqlRunner.run(sql,values)
sql="INSERT INTO item_themes (theme_code, item_id) VALUES ('6',$1);"
values=[@redshirt.id]
SqlRunner.run(sql,values)
sql="INSERT INTO item_themes (theme_code, item_id) VALUES ('5',$1);"
values=[@redshirt.id]
SqlRunner.run(sql,values)


sql="INSERT INTO rental_return_codes (meaning) VALUES ('Out on loan now');"
SqlRunner.run(sql)
sql="INSERT INTO rental_return_codes (meaning) VALUES ('Returned on time, all ok');"
SqlRunner.run(sql)
sql="INSERT INTO rental_return_codes (meaning) VALUES ('Returned late');"
SqlRunner.run(sql)
sql="INSERT INTO rental_return_codes (meaning) VALUES ('Returned with minor damage');"
SqlRunner.run(sql)
sql="INSERT INTO rental_return_codes (meaning) VALUES ('Returned late and damaged');"
SqlRunner.run(sql)
sql="INSERT INTO rental_return_codes (meaning) VALUES ('Written off as a loss');"
SqlRunner.run(sql)
