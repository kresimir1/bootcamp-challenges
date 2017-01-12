class User < ActiveRecord::Base




  has_many :projects_users
  has_many :projects, through: :projects_users


end
