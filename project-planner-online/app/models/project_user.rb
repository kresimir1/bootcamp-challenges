class ProjectsUser < ActiveRecord::Base


  validates :project_id, presence: true
  validates :user_id, presence: true


  belongs_to :user
  belongs_to :project
end
