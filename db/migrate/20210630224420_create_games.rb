class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :game_name
      t.text :description
      t.date :release
      
      t.timestamps
    end
  end
end
