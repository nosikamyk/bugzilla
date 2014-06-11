class Member < ActiveRecord::Base
  before_create :generate_token
  belongs_to :user
  belongs_to :project

  def activate!(current_user)
    if current_user && current_user.email.downcase == member_email.downcase
      update_attribute(:confirmed, true)
    else
      raise "Invalid user!"
    end
  end

  private

  def generate_token
    self.confirmation_token = SecureRandom.urlsafe_base64()
  end
end