class PermittedParams < Struct.new(:params, :current_user)

  def user
    params.require(:user).permit(:email, :password, :uid, :provider, :confirmation_token, :confirmed_at)
  end

  def identity
    params.require(:identity).permit(:name, :email, :password_digest)
  end

end