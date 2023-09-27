# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  image_url  :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artist_id  :bigint           not null
#
# Indexes
#
#  index_artworks_on_artist_id            (artist_id)
#  index_artworks_on_title_and_artist_id  (title,artist_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (artist_id => users.id)
#
class Artwork < ApplicationRecord
    # validates :artist_id, uniqueness: {scope: :title}, presence: true

    # belongs_to :artist,
    #     primary_key: :id,
    #     foreign_key: :artist_id,
    #     class_name: :User

    # has_many :artwork_shares,
    #     primary_key: :id,
    #     foreign_key: :viewer_id,
    #     class_name: :ArtworkShare

    # has_many :shared_artworks,
    #     through: :artwork_shares,
    #     source: :artwork

    
end
