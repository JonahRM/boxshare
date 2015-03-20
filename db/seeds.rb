# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Team.destroy_all
teams=[
{:name=>"University of Nebraska",
:home_location=>"Memorial Stadium, Lincoln",
:mascot=>"Cornhusker"},
{:name=>"Ohio State",
:home_location=>"Ohio Stadium",
:mascot=>"Buckeye"},
{:name=>"UCLA",
:home_location=>"Rose Bowl",
:mascot=>"Bruin"},
{:name=>"Princeton University",
:home_location=>"Princeton Stadium, Princeton",
:mascot=>"Tiger"}
]
teams.each do |team|
  t=Team.new
  t.name=team[:name]
  t.home_location=team[:home_location]
  t.mascot=team[:mascot]
  t.save
end
puts "There are now #{Team.count} teams in the database"

Game.destroy_all


  require 'json'
require 'open-uri'
page=JSON.parse(open("http://api.sportsdatallc.org/ncaafb-t1/2014/REG/schedule.json?api_key=esb2pdrwy6qq57qrtnuyydjd").read)

games_array=Array.new
game_hash=Hash.new

weeks=page['weeks']
weeks.each do |week|
  week['games'].each do |game|
    game_hash=Hash.new
    game_hash[:team_name]=game['home']
    game_hash[:time]=game['scheduled']
    game_hash[:opponent]=game['away']
    games_array.push(game_hash)
end
end
princeton_home_games=games_array.select { |game|  game[:team_name]=="PRI"  }
nebraska_home_games=games_array.select { |game|  game[:team_name]=="NEB"  }
ucla_home_games=games_array.select { |game|  game[:team_name]=="UCLA"  }
ohio_state_home_games=games_array.select { |game|  game[:team_name]=="OSU"  }
princeton_id=Team.find_by(:name=>"Princeton University").id
nebraska_id=Team.find_by(:name=>"University of Nebraska").id
ucla_id=Team.find_by(:name=>"UCLA").id
ohio_state_id=Team.find_by(:name=>"Ohio State").id



princeton_home_games.each do |game|
  g=Game.new
  g.team_id=princeton_id
  g.opponent=game[:opponent]
  g.time=game[:time]
  g.save
end
nebraska_home_games.each do |game|
  g=Game.new
  g.team_id=nebraska_id
  g.opponent=game[:opponent]
  g.time=game[:time]
  g.save
end
ucla_home_games.each do |game|
  g=Game.new
  g.team_id=ucla_id
  g.opponent=game[:opponent]
  g.time=game[:time]
  g.save
end
ohio_state_home_games.each do |game|
  g=Game.new
  g.team_id=ohio_state_id
  g.opponent=game[:opponent]
  g.time=game[:time]
  g.save
end
puts "There are now #{Game.count} games in the database"



