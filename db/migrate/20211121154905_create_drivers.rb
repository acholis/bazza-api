class CreateDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :drivers do |t|
      t.references :user, null: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :driving_licence
      t.integer :status, null: false, default: 0
      t.decimal :earnings, null: false, default: 0
      t.string :cell_phone,         null: false, default: ""

      t.timestamps
    end

    add_index :drivers, :cell_phone,           unique: true

  end
end
