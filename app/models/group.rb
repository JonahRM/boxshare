class Group < ActiveRecord::Base
   def team
  Team.find(team_id)
 end
 def games
  Game.where(:team_id=>self.team.id)
 end
 def ownerships
  Ownership.where(:group_id=>self.id)
 end
 def users
  User.where(:id=>self.ownerships.pluck(:owner_id))
 end
end
