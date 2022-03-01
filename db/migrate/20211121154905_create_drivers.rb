class CreateDrivers < ActiveRecord::Migration[6.1]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.string :driving_licence
      t.integer :status, null: false, default: 0
      t.decimal :earnings, null: false, default: 0
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end

  end
end
