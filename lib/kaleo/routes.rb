module Kaleo
  module Routes
    def kaleo_invites_for(resource, controller: 'kaleo/invitations')
      unless resource.is_a?(Class) || resource.is_a?(String)
        raise ArgumentError, "Wrong \"#{resource}\" class in routes"
      end

      resource_path = resource.is_a?(Class) ? resource.name.underscore.pluralize : resource.to_s

      scope module: nil do
        get  "#{resource_path}/invite/accept/:token",  to: "#{controller}#accept",  as: 'kaleo_invite_accept'
        post "#{resource_path}/invite/confirm/:token", to: "#{controller}#confirm", as: 'kaleo_invite_confirm'
      end
    end
  end
end
