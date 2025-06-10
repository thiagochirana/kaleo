class Kaleo::InvitationMailer < ApplicationMailer
  def invite(user)
    @user = user
    mail(to: @user.email, subject: 'Seu convite para acessar o sistema')
  end
end
