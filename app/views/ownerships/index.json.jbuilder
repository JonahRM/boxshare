json.array!(@ownerships) do |ownership|
  json.extract! ownership, :id, :owner_id, :group_id, :quantity
  json.url ownership_url(ownership, format: :json)
end
