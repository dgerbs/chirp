class Micropost < ActiveRecord::Base

  validates_presence_of :content
  validates_presence_of :user_id

  belongs_to :user

  default_scope order: 'microposts.created_at DESC'
end
