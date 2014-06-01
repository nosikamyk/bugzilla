class Story < ActiveRecord::Base
  validates_presence_of :name, :description, :project_id,:status,:story_type,:owner,:select
  validates :name, uniqueness: {scope: :project_id}
  validates :status, inclusion: {in: %w(Unstarted Started Finished Delivered Accepted Rejected)}
  belongs_to :project
  has_many :comments
  has_many :tasks
  accepts_nested_attributes_for :comments

  attr_accessible :name, :project_id, :description, :status, :owner, :comment_id, :story_type, :select
end