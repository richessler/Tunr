class Song < ActiveRecord::Base
  belongs_to :artist

  validates :artist, presence: true
  validates :title, presence: true
end