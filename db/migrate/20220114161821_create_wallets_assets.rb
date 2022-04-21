class CreateWalletsAssets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets_assets, id: false do |t|

      t.belongs_to :wallet
      t.belongs_to :asset
    end
  end
end
