class User < ActiveRecord::Base

  validates_presence_of :name
  validates_length_of   :name, maximum: 30
  validates_presence_of :email
end
