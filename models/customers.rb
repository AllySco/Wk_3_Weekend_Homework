require_relative("../db/sql_runner")
require_relative("films")
require_relative("tickets")

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds
    ) VALUES (
    '#{ @name }', #{@funds})
    RETURNING id;"
    customer = SqlRunner.run( sql ).first
    @id = customer['id'].to_i
  end

  def Customer.all()
    sql = "SELECT * FROM customers"
    return Customer.get_many(sql)
  end

  def self.delete_all() 
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def films()
    sql = "SELECT films.* FROM films
    INNER JOIN tickets ON
    tickets.films_id = films.id
    WHERE customers_id = #{@id};"
    return Film.get_many(sql)
  end

  def Customer.get_many(sql)
    customers = SqlRunner.run(sql)
    return customers.map { |customer| Customer.new(customer) }
  end

  def Film.get_many(sql)
    films = SqlRunner.run(sql)
    return films.map { |film| Film.new(film) }
  end

  def Ticket.get_many(sql)
    tickets = SqlRunner.run(sql)
    return tickets.map { |ticket| Ticket.new(ticket) }
  end

  def update()
    sql = "
    UPDATE customers SET (
    name,
    funds
    ) = (
    '#{ @name }',
    #{ @funds })
    WHERE id = #{ @id }"
    return SqlRunner.run(sql)
  end
end