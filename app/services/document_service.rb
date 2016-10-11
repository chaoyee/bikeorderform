class DocumentService
  def initialize(order_id)
    @order_id = order_id
  end

  # Use ActiveRecord::Base.connection.exec_query to query db directly only once.
  def to_csv
    query_string = 'select a.po_number as "PO Number", c.name as "Model Name", d.name as Color,
        e.name as Size, b.price as Price, b.quantity as Quantity,
        (b.price*b.quantity) as "Total Amount"
      from orders a, orderdetails b, models c, colors d, sizes e
      where a.id = b.order_id and b.model_id=c.id and b.color_id=d.id and b.size_id=e.id and b.order_id=' + @order_id.to_s
    results = ActiveRecord::Base.connection.exec_query(query_string)
    CSV.generate(headers: true) do |csv|
      csv << results.columns
      results.rows.each do |row|
        csv << row
      end
    end
  end
end
