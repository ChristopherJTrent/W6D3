class ArtworkShare < ApplicationRecord
    belongs_to :artwork,
               class_name: :Artwork,
                inverse_of: :artwork_shares
                
    belongs_to :viewer,
               class_name: :User,
               foreign_key: :viewer_id,
               inverse_of: :artwork_shares

    validates :artwork_id, uniqueness: {scope: :viewer_id}
end
