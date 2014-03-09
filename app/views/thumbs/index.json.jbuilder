json.array!(@thumbs) do |thumb|
  json.extract! thumb, :id, :comment_id, :up_or_down, :user_id
  json.url thumb_url(thumb, format: :json)
end
