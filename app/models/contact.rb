class Contact < ActiveRecord::Base
  attr_accessible :rush_id, :user_id

  belongs_to :rush, class_name: "Rush"
  belongs_to :user, class_name: "User"

  validates :user_id, presence: true
  validates :rush_id, presence: true


end
