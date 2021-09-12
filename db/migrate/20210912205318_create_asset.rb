class CreateAsset < ActiveRecord::Migration[6.1]
  def change
    create_table :assets do |t|
      t.string :code, :description, :source, :segment, :company_name, :national_registry
      t.integer :asset_type

      t.timestamps
    end
  end
end
