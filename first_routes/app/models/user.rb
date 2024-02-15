class User < ApplicationRecord
    validates :username, presence: true

    has_many :artworks,
        class_name: :Artwork,
        inverse_of: :artist,
        dependent: :destroy
    has_many :comments,
        class_name: :Comment,
        inverse_of: :author,
        dependent: :destroy
    has_many :artwork_shares,
        class_name: :ArtworkShare,
        inverse_of: :viewer,
        dependent: :destroy
    has_many :shared_artworks,
        through: :artwork_shares,
         source: :artwork
end
