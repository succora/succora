json.array!(@project_pages) do |project_page|
  json.extract! project_page, :id, :title, :subtitle, :description
  json.url project_page_url(project_page, format: :json)
end
