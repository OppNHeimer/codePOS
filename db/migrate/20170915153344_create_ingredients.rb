class CreateIngredients < ActiveRecord::Migration[5.1]
  def change
    create_table :ingredients do  |t|
			t.references :item, index: true, foreign_key: true, null: false
			t.references :food, index: true, foreign_key: true, null: false

			t.timestamps
    end
  end
end
