class PermittedParams < Struct.new(:params, :current_user)

  def user
    params.require(:user).permit(:email, :password, :uid, :provider, :confirmation_token, :confirmed_at)
  end

  def identity
    params.require(:identity).permit(:name, :email, :password_digest)
  end

  def category
    params.require(:category).permit(:name, :user_id, :category_image)
  end

  def wish
    params.require(:wish).permit(:title, :description, :link, :tags, :image, :rate,
                                 :presented, :present_date, :category_id, :user_id
    )
  end

end