class AddSlugToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :slug, :string
    add_index :users, :slug, unique: true

    add_column :customers, :slug, :string
    add_index :customers, :slug, unique: true

    add_column :drivers, :slug, :string
    add_index :drivers, :slug, unique: true

  end
end
