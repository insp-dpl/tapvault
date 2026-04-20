class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :merchant, null: false, foreign_key: true
      t.references :terminal, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true
      t.integer :amount_cents
      t.string :currency
      t.string :status
      t.string :stripe_payment_intent_id

      t.timestamps
    end
  end
end
