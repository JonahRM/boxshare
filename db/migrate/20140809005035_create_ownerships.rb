class CreateOwnerships < ActiveRecord::Migration
  def change
    create_table :ownerships do |t|
      t.integer :owner_id
      t.integer :group_id
      t.integer :quantity

      t.timestamps
    end
  end
end
