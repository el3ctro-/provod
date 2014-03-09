json.array!(@users) do |user|
  json.extract! user, :id, :user_id, :name, :email, :timestamp, :score, :permission
  json.url user_url(user, format: :json)
end
