class CreateLanesCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :lanes_counts do |t|
      t.integer :lane
      t.references :user, foreign_key: true
      t.references :session, foreign_key: true

      t.timestamps
    end
  end
end
