class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.string :item
      t.string :modification, array: true, default: []
      t.string :message

      t.timestamps
    end
  end
end
