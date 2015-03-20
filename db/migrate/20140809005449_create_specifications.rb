class CreateSpecifications < ActiveRecord::Migration
  def change
    create_table :specifications do |t|
      t.string :comment
      t.integer :will_use
      t.integer :user_id
      t.integer :game_id
      t.integer :group_id

      t.timestamps
    end
  end
end
