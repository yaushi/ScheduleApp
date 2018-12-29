class Meeting < ApplicationRecord
  validates :name, presence: true
  validates :start_time, presence: true
  validates :hidden, inclusion: {in: [true, false]}
  validates :userid, presence: true
  
  belongs_to :user , class_name: 'User' ,optional: true

end
