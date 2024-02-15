# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
ApplicationRecord.transaction do
    User.destroy_all
    
    u1 = User.create!(username: 'Arkevorkhat')
    u2 = User.create!(username: 'JennyJang')

    a1 = Artwork.create!(title: "1", image_url: "example.com/1.png", artist_id: u1.id)
    a2 = Artwork.create!(title: "2", image_url: "example.com/2.png", artist_id: u1.id)
    a3 = Artwork.create!(title: "3", image_url: "example.com/3.png", artist_id: u2.id)
    a4 = Artwork.create!(title: "4", image_url: "example.com/4.png", artist_id: u2.id)

    ArtworkShare.create!(artwork_id: a1.id, viewer_id: u2.id)
    ArtworkShare.create!(artwork_id: a2.id, viewer_id: u2.id)
    ArtworkShare.create!(artwork_id: a2.id, viewer_id: u1.id)
    ArtworkShare.create!(artwork_id: a3.id, viewer_id: u1.id)
    ArtworkShare.create!(artwork_id: a4.id, viewer_id: u1.id)
end