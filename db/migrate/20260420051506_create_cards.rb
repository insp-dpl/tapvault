class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :uid
      t.references :customer, null: false, foreign_key: true
      t.string :nickname
      t.boolean :active

      t.timestamps
    end
    add_index :cards, :uid, unique: true
  end
end
