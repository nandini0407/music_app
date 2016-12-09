class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :category, null: false

      t.timestamps null: false
    end
  end

  # add_index :albums, :band_id
end
