class CreateAvenues < ActiveRecord::Migration[5.2]
  def change
    create_table :avenues do |t|
      t.string :name
      t.integer :n_lane
      t.references :junction, foreign_key: true

      t.timestamps
    end
  end
end
