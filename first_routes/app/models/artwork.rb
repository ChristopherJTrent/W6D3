class Artwork < ApplicationRecord
    validates :image_url, uniqueness: true
    validates [:title, :artist_id], uniqueness: true

    belongs_to :artist,
        class_name: :User
    
end
