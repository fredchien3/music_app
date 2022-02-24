class Album < ApplicationRecord
  validates_presence_of :title, :year, :band_id

  belongs_to :band
  has_many :tracks, dependent: :destroy
end
