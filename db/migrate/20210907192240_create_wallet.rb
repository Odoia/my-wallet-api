class CreateWallet < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.string :name, :description
      t.integer :status
      t.json :distribution, null: false, default: '{}'
      t.references :user

      t.timestamps
    end
  end
end
