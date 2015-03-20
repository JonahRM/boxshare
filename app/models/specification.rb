class Specification < ActiveRecord::Base
  #validates_uniqueness_of :user_id, scope: [:group_id, :game_id]
  def group
    Group.find(self.group_id)
  end
end
