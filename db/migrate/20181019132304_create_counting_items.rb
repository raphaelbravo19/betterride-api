class CreateCountingItems < ActiveRecord::Migration[5.2]
  def change
    create_table :counting_items do |t|
      t.string :hour
      t.string :type_vehicle
      t.string :turn
      t.references :lanes_count, foreign_key: true

      t.timestamps
    end
  end
end
