json.array!(@images) do |image|
  json.extract! image, :id, :name, :description, :ingested_path, :normalized_name, :product_id, :other_versions_id
  json.url image_url(image, format: :json)
end
