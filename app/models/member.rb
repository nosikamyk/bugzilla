class Member < ActiveRecord::Base
  before_create :generate_token
  after_create :send_invite_email
  belongs_to :user
  belongs_to :project

  def activate!
      update(confirmed:  true)
  end

  private

  def send_invite_email
    MemberMailer.confirmation_email(project, self).deliver
  end

  def generate_token
    self.confirmation_token = SecureRandom.urlsafe_base64()
  end
end