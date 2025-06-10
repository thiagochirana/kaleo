def invite(user)
  @user = user
  @invitation_link = "https://seuapp.com/accept-invitation?token=#{user.invitation_token}"

  mail(to: @user.email, subject: 'Seu convite para acessar o sistema')
end
