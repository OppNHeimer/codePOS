class CreateItem < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
			t.string :code
      t.references :category, index: true, foreign_key: true, null: false
      t.timestamps
    end
  end
end
