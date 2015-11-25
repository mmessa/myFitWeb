json.array!(@updates) do |update|
  json.extract! update, :id, :weight, :notes
  json.url update_url(update, format: :json)
end
