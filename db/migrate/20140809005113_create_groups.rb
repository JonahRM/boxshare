class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :team_id

      t.timestamps
    end
  end
end
