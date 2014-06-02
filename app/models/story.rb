class Story < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  has_many :tasks
  has_many :comments
end