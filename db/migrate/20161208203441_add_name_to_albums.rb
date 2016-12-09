class AddNameToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :name, :string, null: false

    add_index :albums, :name
  end
end
