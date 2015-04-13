class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :lockable, :confirmable

  has_many :authentications

  def password_required?
    super && provider.blank?
  end

  class << self
    def from_omniauth(auth)
      where(auth.slice(provider: auth.provider, uid: auth.uid)).first_or_create do |user|
        user.assign_attributes(provider: auth.provider, uid: auth.uid, email: auth.info.email)
        user.save
      end
      #find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
    end

    def create_with_omniouth(auth)
      create! do |user|
        user.provider = auth.provider
        user.uid      = auth.uid
        user.name     = auth.info.email
      end
    end

    def new_with_session(params, session)
      if session['devise.user_attributes']
        new(session['devise.user_attributes'], without_protection: true) do |user|
          user.attributes = params
          user.valid?
        end
      else
        super
      end
    end
  end
end
