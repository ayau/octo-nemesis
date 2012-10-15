# == Schema Information
#
# Table name: rushes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  photo      :string(255)
#  email      :string(255)
#  phone      :string(255)
#  residence  :string(255)
#  origin     :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Rush < ActiveRecord::Base
    attr_accessible :email, :name, :origin, :phone, :photo, :residence

    has_many :rush_comments, dependent: :destroy

    validate :name, presence: true
end
