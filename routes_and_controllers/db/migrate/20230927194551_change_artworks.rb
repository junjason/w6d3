class ChangeArtworks < ActiveRecord::Migration[7.0]
  def change
    add_index :artworks, [:title, :artist_id], unique: true
  end
end
