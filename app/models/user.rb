class User < ApplicationRecord

  before_save {email.downcase!}

  has_many :feed_backs, dependent: :destroy
  has_many :bills, dependent: :destroy

  VALID_EMAIL_REGEX = Settings.validation.email_user

  validates :name, presence: true, length:{maximum: Settings.validation.name_user_max}
  validates :email, presence: true, length:{maximum: Settings.validation.password_user_max},
    format:{with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  validates :password, presence: true, length:{minimum: Settings.validation.password_user_min}, allow_nil: true
  validates :phone, presence: true
  validates :idCart, presence: true

  
  has_secure_password

  def authenticated? token
    return false if digest.nil?
    BCrypt::Password.new("password_digest").is_password?(token)
  end

  def User.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end

end
