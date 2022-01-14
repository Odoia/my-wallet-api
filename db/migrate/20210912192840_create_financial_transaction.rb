class CreateFinancialTransaction < ActiveRecord::Migration[6.1]
  def change
    create_table :financial_transactions do |t|
      t.belongs_to :asset, index: { unique: true }, foreign_key: true
      t.belongs_to :wallet, index: true, foreign_key: true

      t.integer :financial_type, :quantity
      t.decimal :unit_value, :tax, precision: 8, scale: 2
      t.datetime :transaction_date

      t.datetime :deleted_at, limit: 6
      t.timestamps
    end
  end
end
