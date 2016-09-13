json.extract! orderdetail, :id, :order_id, :model_id, :size_id, :color_id, :price, :quantity, :created_at, :updated_at
json.url orderdetail_url(orderdetail, format: :json)