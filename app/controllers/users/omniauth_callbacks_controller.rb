class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate_user!

  def all
    user = User.from_omniauth(request.env['omniauth.auth'])
    if user.persisted?
      flash.notice = 'Signed in!'
      sign_in(user)
      redirect_to persons_profile_path
      # sign_in_and_redirect user
    else
      session['devise.user_attributes'] = user.attributes
      redirect_to new_user_registration_url
    end
  end


  alias_method :twitter, :all
  alias_method :facebook, :all
end

