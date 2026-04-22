class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :uid
      t.references :customer, null: true, foreign_key: true
      t.string :nickname
      t.boolean :active, default: true

      t.timestamps
    end
    add_index :cards, :uid, unique: true
  end
end
