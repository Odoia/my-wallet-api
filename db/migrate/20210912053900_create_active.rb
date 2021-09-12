class CreateActive < ActiveRecord::Migration[6.1]
  def change
    create_table :actives do |t|
      t.string :code, :description, :source, :segment, :company_name, :national_registry
      t.integer :active_type

      t.timestamps
    end
  end
end
