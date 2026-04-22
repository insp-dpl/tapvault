class AddJtiToMerchants < ActiveRecord::Migration[7.1]
  def change
    add_column :merchants, :jti, :string, null: false
    add_index :merchants, :jti
  end
end
