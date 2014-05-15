json.array!(@pledges) do |pledge|
  json.extract! pledge, :id, :pledge_id, :first_name, :last_name, :email
  json.url pledge_url(pledge, format: :json)
end
