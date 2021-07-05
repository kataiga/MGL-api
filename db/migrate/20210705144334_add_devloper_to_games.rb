class AddDevloperToGames < ActiveRecord::Migration[6.1]
  def change
    add_reference :games, :devloper
  end
end
