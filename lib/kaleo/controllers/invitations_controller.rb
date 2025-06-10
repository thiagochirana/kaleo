module Kaleo
  class InvitationsController < ActionController::Base
    protect_from_forgery with: :null_session if Rails.application.config.api_only

    def accept
      @user = Kaleo.user_class.find_by(invitation_token: params[:token])

      if @user.nil? || (@user.invite_expires_at && @user.invite_expires_at < Time.current)
        render plain: 'Convite inválido ou expirado', status: :gone and return
      end

      respond_to do |format|
        format.html { render :accept }
        format.json { render json: { message: 'Convite válido', user: @user.slice(:id, :email) } }
      end
    end

    def confirm
      @user = Kaleo.user_class.find_by(invitation_token: params[:token])
      render plain: 'Convite inválido', status: :not_found unless @user and return

      password_param = Kaleo.configuration.password_attribute.to_s
      password = params['password']
      password_confirmation = params['password_confirmation']

      if password.blank? || password != password_confirmation
        render plain: 'Senhas não coincidem', status: :unprocessable_entity and return
      end

      @user.assign_attributes(
        password_param => password,
        invitation_token: nil,
        invited_at: nil
      )

      if @user.save!
        render plain: 'Convite aceito com sucesso!'
      else
        render plain: "Erro ao salvar usuário: #{@user.errors.full_messages.join(', ')}", status: :unprocessable_entity
      end
    end
  end
end
