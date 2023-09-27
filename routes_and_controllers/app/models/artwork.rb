class Artwork < ApplicationRecord
    validates :artist_id, uniqueness: {scope: :title}, presence: true
    
end