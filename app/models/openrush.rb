class Openrush < ActiveRecord::Base
  attr_accessible :rush_id, :class, :email, :name, :phone, :photo, :residence

  validates_uniqueness_of :rush_id, :allow_nil => true

end
