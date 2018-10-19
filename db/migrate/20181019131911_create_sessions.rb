class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.integer :dia
      t.string :mes
      t.string :started_at
      t.string :finished_at
      t.references :junction, foreign_key: true

      t.timestamps
    end
  end
end
