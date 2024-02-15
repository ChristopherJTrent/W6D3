class Artwork < ApplicationRecord
    validates :image_url, uniqueness: true, presence: true
    validates :title, uniqueness: {scope: :artist_id}

    def self.artworks_for_user_id(user_id)
        own_artworks = Artwork.where(artist_id: user_id) #returns activerecord object
        shared_artworks = Artwork.joins(:artwork_shares).where(artwork_shares: {viewer_id: user_id}) #returns activerecord object
        (own_artworks + shared_artworks).uniq
    end
    belongs_to :artist,
        class_name: :User
    has_many :artwork_shares,
        class_name: :ArtworkShare,
        dependent: :destroy

    has_many :shared_viewers,
        through: :artwork_shares,
         source: :viewer
end
