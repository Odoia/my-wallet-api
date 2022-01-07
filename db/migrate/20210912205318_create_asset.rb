class CreateAsset < ActiveRecord::Migration[6.1]
  def change
    create_table :assets do |t|
      t.string :code, :description, :source, :segment, :company_name, :national_registry
      t.integer :asset_type
      
      t.datetime :deleted_at, limit: 6
      t.timestamps
    end
  end
end
