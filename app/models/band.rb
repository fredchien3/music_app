class Band < ApplicationRecord
  validates_presence_of :name

  has_many :albums, dependent: :destroy
  has_many :tracks, through: :albums
end
