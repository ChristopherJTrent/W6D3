class User < ApplicationRecord
    validates :username, presence: true

    has_many :artworks,
        class_name: :Artwork,
        foreign_key: :artist_id
end
