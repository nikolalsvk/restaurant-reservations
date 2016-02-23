module InvitationsHelper

  def panel_class(invitation)
      if invitation.confirmed == nil
        return "info"
      elsif invitation.expired?
        return "warning"
      elsif invitation.confirmed == true
        return "success"
      else
        return "danger"
      end
  end

end
