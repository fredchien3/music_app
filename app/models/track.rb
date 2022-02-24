class Track < ApplicationRecord
  validates_presence_of :title, :ord, :album_id

  belongs_to :album
  has_one :band, through: :album, autosave: false
end
