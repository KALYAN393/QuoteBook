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
          username: data['name'],
           email: data['email'],
           password: Devise.friendly_token[0,20]
        )
    end
    user
end 
end
