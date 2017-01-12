class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true

  has_many :projects_users
  has_many :projects, through: :projects_users
  has_many :tasks
end
