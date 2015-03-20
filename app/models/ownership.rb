class Ownership < ActiveRecord::Base
    validates :owner_id, presence: true
  validates :group_id, presence: true
  validates :quantity, presence: true

  def user
    User.find(owner_id)
  end
  def group
    Group.find(group_id)
  end
  def team
    Team.find(self.group.team_id)
  end

end
