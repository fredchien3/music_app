class Note < ApplicationRecord
  validates_presence_of :user_id, :track_id, :text

  belongs_to :user
  belongs_to :track
end
