# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  artwork_id :bigint           not null
#  viewer_id  :bigint           not null
#
# Indexes
#
#  index_artwork_shares_on_artwork_id                (artwork_id)
#  index_artwork_shares_on_artwork_id_and_viewer_id  (artwork_id,viewer_id) UNIQUE
#  index_artwork_shares_on_viewer_id                 (viewer_id)
#
# Foreign Keys
#
#  fk_rails_...  (artwork_id => artworks.id)
#  fk_rails_...  (viewer_id => users.id)
#
class ArtworkShare < ApplicationRecord
    validates :artwork_id, uniqueness: {scope: :viewer_id}, presence: true

    belongs_to :artwork,
        primary_key: :id,
        foreign_key: :artwork_id,
        class_name: :Artwork

    belongs_to :viewer,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :User
end
