json.array!(@specifications) do |specification|
  json.extract! specification, :id, :comment, :will_use, :user_id, :game_id, :group_id
  json.url specification_url(specification, format: :json)
end
