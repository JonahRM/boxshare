class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 def ownerships
    Ownership.where(:owner_id=>self.id)
  end
  def groups
    Group.where(:id=>self.ownerships.pluck(:group_id))
  end
  def teams
    Team.where(:id=>self.groups.pluck(:team_id))
  end
  def games
    Game.where(:team_id=>self.teams.pluck(:id))
  end
end
