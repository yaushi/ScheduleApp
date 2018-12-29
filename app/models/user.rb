class User < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  
  has_many :meetings, class_name: 'Meeting', foreign_key: 'userid', dependent: :destroy
  
  has_many :relationship_follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :relationship_followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
end