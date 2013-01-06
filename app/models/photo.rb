class Photo < ActiveRecord::Base
  attr_accessible :photo_url, :rush_id

  belongs_to :rush, class_name: "Rush"

  validates :rush_id, presence: true
  validates :photo_url, presence: true


end
