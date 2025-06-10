module Kaleo
  class InvitationMailer < ::ApplicationMailer
    def invite(user)
      @user = user
      @accept_url = kaleo_invite_accept_url(token: user.invitation_token)
      mail(to: user.email, subject: 'Convite para acessar o sistema')
    end
  end
end