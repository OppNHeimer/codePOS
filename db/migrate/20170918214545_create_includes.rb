class CreateIncludes < ActiveRecord::Migration[5.1]
  def change
    create_table :includes do |t|
      t.references :item, index: true, foreign_key: true, null: false
			t.references :ingredient, index: true, foreign_key: true, null: false

			t.timestamps
    end
  end
end
