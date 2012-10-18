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
    attr_accessible :email, :name, :origin, :phone, :photo, :residence, :friend_tokens

    has_many :rush_comments, dependent: :destroy
    has_many :cpratings

    has_and_belongs_to_many :friends,
                          :class_name => "Rush",
                          :join_table => "friendships",
                          :foreign_key => "rush_id",
                          :association_foreign_key => "friend_id"

    validates :name, presence: true
    validates_uniqueness_of :name
    #For now I got rid of phone validation in case we have no phone number
    #validates :phone, presence: true
    #validates_uniqueness_of :phone

    attr_reader :friend_tokens  
    
    def friend_tokens=(ids)  
        self.friend_ids = ids.split(",")  
    end  
end
