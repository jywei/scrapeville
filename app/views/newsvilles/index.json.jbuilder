json.array!(@newsvilles) do |newsville|
  json.extract! newsville, :id, :title, :body, :time, :image_url
  json.url newsville_url(newsville, format: :json)
end
