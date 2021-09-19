class CreateAsset < ActiveRecord::Migration[6.1]
  def change
    create_table :assets do |t|
      t.string :code, :description, :segment, :company_name, :national_registry
      t.integer :asset_type, :source

      t.timestamps
    end
  end
end
