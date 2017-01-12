class Meetup < ActiveRecord::Base

  validates :name, presence: true
  validates :description, presence: true, length: { maximum: 5000 }
  validates :location, presence: true
  validates :creator, presence: true


  has_many :meetups_users
  has_many :users, through: :meetups_users
end
