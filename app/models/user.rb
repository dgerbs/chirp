class User < ActiveRecord::Base

  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates_presence_of   :name
  validates_length_of     :name, maximum: 30
  validates_presence_of   :email
  validates_uniqueness_of :email, case_sensitive: false
  validates_format_of     :email, with: VALID_EMAIL_REGEX

  before_save { |user| user.email = email.downcase }
end
