json.array!(@games) do |game|
  json.extract! game, :id, :team_id, :opponent, :time
  json.url game_url(game, format: :json)
end
