require('pg')

class SqlRunner

  def self.run( sql, values = [])
    # db = PG.connect({dbname: 'smart_zenny',
    #   host: 'localhost'  })
    db = PG.connect( {dbname: 'Database',
      host: 'ec2-1-1-1-1-1.compute-1.amazonaws.com',
      port: 5432, user: 'mwilsonthorne@gmail.com', password: 'ZAQ!2wsx'
      })


    db.prepare("save", sql)
    result =  db.exec_prepared("save", values)

    db.close()

    return result
  end


end

# PG.connect( {dbname: 'dasdkdsaldkj',
# host: 'ec2-1-1-1-1-1.compute-1.amazonaws.com',
# port: 5432, user: 'nsdlkdjalskjd', password: 'sadlskjadlkjASDAD'})
