json.array!(@games) do |game|
  json.extract! game, :id, :name, :dscr, :release_date, :category_id
  json.url game_url(game, format: :json)
end
