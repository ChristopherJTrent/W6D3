class CreateArtwork < ActiveRecord::Migration[7.1]
  def change
    create_table :artworks do |t|
      t.string :title, null: false
      t.string :image_url, null: false, index: {unique: true}
      t.references :artist, foreign_key: {to_table: :users}

      #add_index(:accounts, [:branch_id, :party_id], unique: true)
      

      t.timestamps
    end
    add_index(:artworks, [:title, :artist_id], unique: true)
  end
end
