class Task < ActiveRecord::Base

  validates :name, presence: true
  validates :project_id, presence: true, numericality: true
  validates :user_id, numericality: true



  belongs_to :project
  has_one :user
end
