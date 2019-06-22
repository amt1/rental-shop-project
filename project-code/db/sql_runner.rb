require('pg')
class SqlRunner

  def self.run( sql, values = [] )
    begin
      # db = PG.connect({ dbname: 'rental_shop', host: 'localhost' })
      db = PG.connect({dbname: 'd9mqp2n54ehm0o',
        host: 'ec2-54-235-114-242.compute-1.amazonaws.com',
        port: 5432, user: 'fddzwyrrsngwgk',
        password: '346e5728454d0d993737ddbbdf68ccb7fe5c2eb040deb8e7d056f84e92e31281'})

      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
