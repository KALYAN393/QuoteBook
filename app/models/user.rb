class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and 
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:github]
  has_many :posts   
  has_many :likes

  has_many :comments, dependent: :destroy

  has_many :post_users, dependent: :destroy
  has_many :posts, through: :post_users

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
   
    unless user
        user = User.create(
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
end

# def self.from_omniauth(auth)
#   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#     user.email = auth.info.email
#     user.password = Devise.friendly_token[0,20]
#     user.username = auth.info.name   # assuming the user model has a name
#        # assuming the user model has an image
#   end
# end


  
end
