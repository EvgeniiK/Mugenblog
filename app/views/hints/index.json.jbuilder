json.array!(@hints) do |hint|
  json.extract! hint, :id, :theme, :command, :description, :link
  json.url hint_url(hint, format: :json)
end
