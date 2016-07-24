json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :sku, :normalized_name, :tags_id, :relateds_id
  json.url product_url(product, format: :json)
end
