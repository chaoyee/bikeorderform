json.extract! model, :id, :name, :price, :created_at, :updated_at
json.url model_url(model, format: :json)