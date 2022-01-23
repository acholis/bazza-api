class CreateRides < ActiveRecord::Migration[6.1]
  def change
    create_table :rides do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :driver, null: true, foreign_key: true
      t.integer :pick_up_time
      t.string :pick_up_from, default: ''
      t.string :drop_to, default: ''
      t.decimal :amount, null: false, default: 0
      t.integer :status, null: false, default: 0

      t.boolean :started, null: false, default: false
      t.boolean :finished, null: false, default: false

      t.timestamps
    end
  end
end
