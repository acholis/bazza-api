class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :status, null: false, default: 1
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
