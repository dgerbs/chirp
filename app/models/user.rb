class User < ActiveRecord::Base

  has_secure_password
  has_many :microposts, dependent: :destroy

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of   :name
  validates_length_of     :name, maximum: 30
  validates_presence_of   :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of     :email, with: VALID_EMAIL_REGEX
  validates_presence_of   :password
  validates_presence_of   :password_confirmation
  validates_length_of     :password, minimum: 6

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
  
end
