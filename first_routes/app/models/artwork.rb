class Artwork < ApplicationRecord
    validates :image_url, uniqueness: true, presence: true
    validates :title, uniqueness: {scope: :artist_id}

    belongs_to :artist,
        class_name: :User
    has_many :artwork_shares,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_viewers,
        through: :artwork_shares,
         source: :viewer
end
