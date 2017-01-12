# Use this file to import the sales information into the
# the database.
require "csv"
require "pg"
require 'pry'

def db_connection
  begin
    connection = PG.connect(dbname: "korning")
    yield(connection)
  ensure
    connection.close
  end
end

#Employee info table
@employee_data = []
CSV.foreach('sales.csv', headers:true) do |row|
  db_connection do |conn|
    @employee_name = (row["employee"].split("("))[0]
    employee_email = (row["employee"].split("("))[1].gsub(/[)]/, "")
    unless @employee_data.include?(@employee_name)
      @employee_data << @employee_name
      sql = %(
      INSERT INTO employees (employee_name, employee_email) VALUES ($1,$2)
      )
      conn.exec_params(sql, [@employee_name, employee_email])
    end
  end
end

#Customer info table
@customer_data = []
CSV.foreach('sales.csv', headers:true) do |row|
  db_connection do |conn|
    @customer = (row["customer_and_account_no"].split("("))[0]
    customer_account_no = (row["customer_and_account_no"].split("("))[1].gsub(/[)]/, "")
    unless @customer_data.include?(@customer)
      @customer_data << @customer
      sql = %(
      INSERT INTO customers (customer, customer_account_no) VALUES ($1,$2)
      )
      conn.exec_params(sql, [@customer, customer_account_no])
    end
  end
end

CSV.foreach('sales.csv', headers:true) do |row|
  db_connection do |conn|
        @employee_id = db_connection {|conn| conn.exec("SELECT id FROM employees WHERE employee_name = '#{(row["employee"].split("("))[0]}'")}
        @customer_id = db_connection {|conn| conn.exec("SELECT id FROM customers WHERE customer = '#{(row["customer_and_account_no"].split("("))[0]}'")}
        sale_amount = row["sale_amount"].gsub(/[$]/, "")
        sql = %(
        INSERT INTO sales (employee_id, customer_id, product_name,
        sale_date, sale_amount, units_sold, invoice_no, invoice_frequency) VALUES ($1,$2,$3,$4,$5,$6,$7,$8)
        )
        conn.exec_params(sql, [@employee_id[0]["id"], @customer_id[0]["id"], row["product_name"], row["sale_date"], sale_amount,
         row["units_sold"], row["invoice_no"], row["invoice_frequency"]])
  end
end
