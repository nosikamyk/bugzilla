class Project < ActiveRecord::Base
  has_many :users, through: :members
  has_many :members
end