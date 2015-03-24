class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :lockable, :confirmable
end

def self.from_omniauth(auth)
  find_by_provider_and_uid(auth["provider"], auth["uid"]) || create_with_omniauth(auth)
end

def self.create_with_omniouth(auth)
  create! do |user|
    user.provider = auth ["provider"]
    user.uid = auth ["uid"]
    user.name = auth ["info"]["name"]
    end
  end