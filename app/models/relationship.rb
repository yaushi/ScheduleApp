class Relationship < ApplicationRecord
  validates :follower_id, presence: true
  validates :followed_id, presence: true
  
  belongs_to :user, class_name: 'User' ,optional: true
  
end
