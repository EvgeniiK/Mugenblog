json.array!(@raw_data) do |raw_datum|
  json.extract! raw_datum, :id, :theme, :command, :description, :link
  json.url raw_datum_url(raw_datum, format: :json)
end
