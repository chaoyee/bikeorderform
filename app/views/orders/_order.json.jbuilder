json.extract! order, :id, :po_number, :shipment_require_date, :order_date, :ship_to, :reference, :created_at, :updated_at
json.url order_url(order, format: :json)