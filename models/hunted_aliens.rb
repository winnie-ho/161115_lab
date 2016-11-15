require ('pg')
class HuntedAlien

attr_accessor :name, :species, :bounty, :danger_level
attr_reader :id

def initialize(options)
  @name = options["name"]
  @species = options["species"]
  @bounty = options["bounty"].to_i
  @danger_level = options["danger_level"]
  @id = options["id"].to_i if options ["id"]
end

def save
  db = PG.connect( {dbname: 'hunted_aliens', host: 'localhost'})
  sql = "INSERT INTO hunted_aliens (name, species, bounty, danger_level) VALUES ('#{@name}', '#{@species}', #{@bounty}, '#{@danger_level}') returning *;"
  result = db.exec(sql)
  @id = result[0]["id"].to_i
  db.close
end

def update
  return unless @id
  db = PG.connect( {dbname: 'hunted_aliens', host: 'localhost'})
  sql = "UPDATE hunted_aliens SET
        (name, species, bounty, danger_level) = 
        ('#{@name}', '#{@species}', #{bounty}, '#{@danger_level}')
        WHERE id = #{@id};"
  db.exec(sql)
  db.close
end

def self.all
  db = PG.connect( {dbname: 'hunted_aliens', host: 'localhost'})
  sql = "SELECT * FROM hunted_aliens;"
  orders = db.exec(sql) 
  db.close 
  return orders.map{|hash|HuntedAlien.new(hash)}
end

def self.delete_all
  db = PG.connect( {dbname: 'hunted_aliens', host: 'localhost'})
  sql = "DELETE FROM hunted_aliens;"
  db.exec(sql)
  db.close
end


end