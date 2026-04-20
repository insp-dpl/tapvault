class CreateTerminals < ActiveRecord::Migration[7.1]
  def change
    create_table :terminals do |t|
      t.references :merchant, null: false, foreign_key: true
      t.string :device_identifier
      t.string :name
      t.string :status
      t.datetime :last_seen_at

      t.timestamps
    end
    add_index :terminals, :device_identifier, unique: true
  end
end
