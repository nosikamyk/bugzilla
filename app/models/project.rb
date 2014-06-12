class Project < ActiveRecord::Base

  has_many :members
  has_many :users, through: :members
  has_many :stories


  def set_owner(user)
    members.create!(user: user, member_name: user.email, member_email: user.email, manager: true, confirmed: true)
  end
end