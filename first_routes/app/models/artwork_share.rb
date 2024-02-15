class ArtworkShare < ApplicationRecord
    belongs_to :artwork,
               class_name: :Artwork
    belongs_to :viewer,
               class_name: :User,
               foreign_key: :viewer_id
    validates :artwork_id, uniqueness: {scope: :viewer_id}
end
