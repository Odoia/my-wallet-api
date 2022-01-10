class CreateUser < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name

      t.datetime :deleted_at, limit: 6
      t.timestamps
    end
  end
end
