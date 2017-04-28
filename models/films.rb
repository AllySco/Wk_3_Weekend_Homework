require_relative("../db/sql_runner")
require_relative("customers.rb")

class Film 

  attr_accessor :title, :price, :id

  def initialize( options )
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price
    ) VALUES (
    '#{@title}', #{@price}) 
    RETURNING id;"
    film = SqlRunner.run( sql ).first
    @id = film['id'].to_i
  end

  def Film.all()
    sql = "SELECT * FROM films;"
    return Film.get_many(sql)
  end

  def Film.delete_all() 
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end

  def customers()
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets ON
    tickets.customers_id = customers.id
    WHERE films_id = #{@id};"
    return Customer.get_many(sql)
  end
end