class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :omniauthable, omniauth_providers: [:facebook, :google_oauth2]
  validates :user_name, presence: true
  after_create_commit :update_username



  has_many :products, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_one_attached :avatar do |attachable| 
    attachable.variant :thumb, resize_to_limit: [100, 100]
  end

  scope :not_me, ->(current_user){where.not(id: current_user.id)}


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.user_name = auth.info.name
    end
  end


  private 

  def update_username
    self.update user_name: user_name.split.map(&:capitalize).join(" ")
  end

end
