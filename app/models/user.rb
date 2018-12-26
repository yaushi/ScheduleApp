class User < ApplicationRecord
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  
  #has_many :meetings, :dependent => :destroy
  has_many :meetings, dependent: :destroy
end
