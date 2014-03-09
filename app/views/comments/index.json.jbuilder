json.array!(@comments) do |comment|
  json.extract! comment, :id, :post_id, :comment_id, :words, :votes
  json.url comment_url(comment, format: :json)
end
