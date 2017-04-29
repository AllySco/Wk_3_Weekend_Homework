require_relative("../db/sql_runner")
require_relative("films.rb")
require_relative("customers.rb")

class Ticket

  attr_reader :id
  attr_accessor :customers_id, :films_id

  def initialize( options )
    @id = options['id'].to_i
    @customers_id = options['customers_id'].to_i
    @films_id = options['films_id'].to_i
  end

  def save()
    sql = "INSERT INTO tickets (customers_id, films_id
    ) VALUES (
    #{@customers_id}, #{@films_id}) RETURNING id"
    ticket = SqlRunner.run( sql ).first
    @id = ticket['id'].to_i
  end

  def Ticket.all()
    sql = "SELECT * FROM tickets"
    return Ticket.get_many(sql)
  end

  def Ticket.delete_all() 
    sql = "DELETE FROM tickets"
    SqlRunner.run(sql)
  end

  def film()
    sql = "SELECT * FROM films
    WHERE id = #{@films_id};"
    films = SqlRunner.run(sql).first()
    return Film.new(films)
  end

  def customer()
    sql = "SELECT * FROM customers
    WHERE id = #{@customers_id};"
    customer = SqlRunner.run(sql).first()
    return Customer.new(customer)
  end

end