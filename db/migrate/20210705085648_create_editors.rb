class CreateEditors < ActiveRecord::Migration[6.1]
  def change
    create_table :editors do |t|
      t.string :company_name

      t.timestamps
    end
  end
end
