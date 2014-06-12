class MemberMailer < ActionMailer::Base
  default from: "no-reply@bugzilla.com"

  def confirmation_email(project, member)
    @member = member
    @project = project
    mail(to: member.member_email, subject: 'Confirm membership of the project')
  end

end