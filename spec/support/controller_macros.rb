module ControllerMacros
  def sign_in_user
    before do
      @user = create :user
      session[:user_id] = @user.id
    end
  end
end