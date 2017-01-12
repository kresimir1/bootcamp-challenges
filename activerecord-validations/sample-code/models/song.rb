class Song < ActiveRecord::Base
  validates :year, presence: true, length: {minimum: 2, maximum: 4}
  validates :year, numericality: {only_integer: true}
  validates :title, presence: true, length: {minimum: 1, maximum: 50}
  validates :artist, presence:  true, length: {minimum: 1, maximum: 50}
  validates :album, presence: true, length: {minimum:1, maximum: 50}
  validates :track_number, presence: true, numericality: {only_integer: true}
  validates :track_number, inclusion: { in: ["electronic", "Synth-pop", "	Indie",
     "alternative", "rock", "Fri.", "Sat."] }
  validates :length_in_seconds, numericality: true
  validates :image, length: {minimum: 1, maximum: 50}
end
