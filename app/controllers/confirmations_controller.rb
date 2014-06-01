class ConfirmationsContr < Devise::confirmations_controller
  private
  def create
    redirect_to controller: :statics, action: :home
  end
end