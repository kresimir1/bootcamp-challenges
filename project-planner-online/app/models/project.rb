class Project < ActiveRecord::Base

  validates :name, presence: true

  has_many :projects_users
  has_many :users, through: :projects_users
  has_many :tasks
end
