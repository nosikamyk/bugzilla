class MemberMailer < ActionMailer::Base
  default from: "no-reply@bugzilla.com"

  def confirmation_email(project, member, token_value)
    @member = member
    @project = project
    @url = project_member_path(@project, @member)+token_value
    mail(to: @member.member_email, subject: 'Confirm membership of the project')
  end

end