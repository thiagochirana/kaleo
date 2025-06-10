def invite(user)
  @user = user
  @invitation_link = kaleo_invite_accept_url(token: user.invitation_token)

  mail(to: @user.email, subject: 'Seu convite para acessar o sistema')
end
