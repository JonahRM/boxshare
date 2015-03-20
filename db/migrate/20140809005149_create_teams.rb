class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :mascot
      t.string :home_location
      t.string :name

      t.timestamps
    end
  end
end
