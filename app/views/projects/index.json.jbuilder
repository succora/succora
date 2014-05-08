json.array!(@projects) do |project|
  json.extract! project, :id, :title, :subtitle, :goal, :description
  json.url project_url(project, format: :json)
end
