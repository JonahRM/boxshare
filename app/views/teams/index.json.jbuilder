json.array!(@teams) do |team|
  json.extract! team, :id, :mascot, :home_location, :name
  json.url team_url(team, format: :json)
end
