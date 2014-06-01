class ConfirmationsController < Devise::ConfirmationsController
  def after_confirmation_path_for(resource_name, resource)
    if current_user.last_sign_in_at.nil? then
      redirect_to :controller => :statics, :action => :home
    end
  end
end