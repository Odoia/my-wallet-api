class CreateWallet < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.string :name, :description
      t.integer :status
      t.belongs_to :user, index: true, foreign_key: true

      t.datetime :deleted_at, limit: 6
      t.timestamps
    end
  end
end
