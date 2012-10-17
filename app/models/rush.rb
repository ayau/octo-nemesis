# == Schema Information
#
# Table name: rushes
#
#  id                 :integer          not null, primary key
#  name               :string(255)
#  photo              :string(255)
#  email              :string(255)
#  phone              :string(255)
#  residence          :string(255)
#  origin             :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  primary_contact_id :integer
#

class Rush < ActiveRecord::Base
    attr_accessible :email, :name, :origin, :phone, :photo, :residence

    has_many :rush_comments, dependent: :destroy
    has_many :cpratings

    validates :name, presence: true
    validates_uniqueness_of :name
    #For now I got rid of phone validation in case we have no phone number
    #validates :phone, presence: true
    #validates_uniqueness_of :phone
end
