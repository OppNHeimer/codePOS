class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
			t.string :name
			t.string :code
			t.string :category
			
      t.timestamps
    end
  end
end
