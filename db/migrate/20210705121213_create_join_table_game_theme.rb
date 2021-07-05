class CreateJoinTableGameTheme < ActiveRecord::Migration[6.1]
  def change
    create_join_table :games, :themes do |t|
      t.index [:game_id, :theme_id]
      t.index [:theme_id, :game_id]
    end
  end
end
