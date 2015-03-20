class Team < ActiveRecord::Base
    validates :mascot, presence: true
  validates :home_location, presence: true
  validates :name, presence: true

  def games
    Game.where(:team_id=>id)
  end
  def groups
   Group.where(:team_id=>id)
 end
 def ownerships
  Ownership.where(:group_id=>self.groups.pluck(:id))
 end
 def users
  User.where(:id=>self.ownerships.pluck(:user_id))
 end
end
