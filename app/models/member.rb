class Member < ActiveRecord::Base
  before_create :generate_token
  belongs_to :user
  belongs_to :project

  private

  def generate_token
    self.confirmation_token = SecureRandom.urlsafe_base64()
  end
end