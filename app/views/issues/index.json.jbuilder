json.array!(@issues) do |issue|
  json.extract! issue, :id, :title, :issue_frequency_id, :archive
  json.url issue_url(issue, format: :json)
end
