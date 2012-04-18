class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    #print env['omniauth.auth']
    @user = User.find_or_create_for_facebook_oauth(env["omniauth.auth"], current_user)
    
    @user.generate_friendships_from_facebook

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Facebook"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

end