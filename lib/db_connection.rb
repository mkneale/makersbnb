require 'pg'

class DBConnection
  def self.setup(database)
    @con = PG.connect(dbname: test_or_dev_db(database))
  end

  def self.query(sql)
    @con.exec sql
  end

  private

  def self.test_or_dev_db(database)
    ENV['RACK_ENV'] == 'test' ? database + '_test' : database
  end
end
