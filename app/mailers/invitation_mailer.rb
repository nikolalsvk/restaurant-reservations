class InvitationMailer < ApplicationMailer

  default :from => "nikolaseap@gmail.com"

  helper :invitation_mailer

  def invitation_mail(user, invitation)
    @user = user
    @invitation = invitation
    @url = guest_invitation_url(@user, @invitation)

    mail(:to => @user.email, :subject => "Invitation to a restaurant")
  end


end
