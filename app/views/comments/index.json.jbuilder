json.array!(@comments) do |comment|
  json.extract! comment, :id, :create_date, :content, :owner_id, :game_id
  json.url comment_url(comment, format: :json)
end
