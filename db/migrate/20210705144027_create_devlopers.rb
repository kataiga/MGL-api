class CreateDevlopers < ActiveRecord::Migration[6.1]
  def change
    create_table :devlopers do |t|
      t.string :devloper_name

      t.timestamps
    end
  end
end
