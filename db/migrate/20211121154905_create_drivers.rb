class CreateDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :drivers do |t|
      t.references :user, null: false, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.integer :status, null: false, default: 0
      t.decimal :earnings, null: false, default: 0

      t.timestamps
    end
  end
end
