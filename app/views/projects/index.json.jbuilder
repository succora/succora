json.array!(@projects) do |project|
  json.extract! project, :id, :project_id, :title, :subtitle, :description, :goal, :end
  json.url project_url(project, format: :json)
end
