json.array!(@details) do |detail|
  json.extract! detail, :id, :first_name, :last_name, :email
  json.url detail_url(detail, format: :json)
end
