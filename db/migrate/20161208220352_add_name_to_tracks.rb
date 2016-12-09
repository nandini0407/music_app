class AddNameToTracks < ActiveRecord::Migration
  def change
    add_column :tracks, :name, :string, null: false
    
    add_index :tracks, :name
  end

end
