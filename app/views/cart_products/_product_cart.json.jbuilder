json.extract! cart_product, :id, :products_id, :cart_id, :created_at, :updated_at
json.url cart_product_url(cart_product, format: :json)
