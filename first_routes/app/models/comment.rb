class Comment < ApplicationRecord
    belongs_to :author,
        class_name: :User
    belongs_to :artwork,
        class_name: :Artwork
end
