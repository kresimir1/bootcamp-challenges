class MeetupsUser < ActiveRecord::Base

  validates :meetup_id, presence: true
  validates :user_id, presence: true




  belongs_to :user
  belongs_to :meetup
end
