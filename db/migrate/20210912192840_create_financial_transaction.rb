class CreateFinancialTransaction < ActiveRecord::Migration[6.1]
  def change
    create_table :financial_transactions do |t|
      t.references :asset, :wallet
      t.integer :financial_type, :quantity
      t.decimal :amount, :tax, precision: 8, scale: 2
      t.datetime :transaction_date

      t.datetime :deleted_at, limit: 6
      t.timestamps
    end
  end
end
