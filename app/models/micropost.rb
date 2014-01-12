class Micropost < ActiveRecord::Base

  validates_length_of :content, maximum: 140
  validates_presence_of :content
  validates_presence_of :user_id

  belongs_to :user

  default_scope order: 'microposts.created_at DESC'

  def self.from_users_followed_by(user)
    followed_user_ids = user.followed_user_ids
    where("user_id IN (?) OR user_id = ?", followed_user_ids, user)
  end
end
