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
#  active             :integer          default(1)
#

class Rush < ActiveRecord::Base
    attr_accessible :email, :name, :origin, :phone, :photo, :residence, :friend_tokens, :contacts, :has_data_photo

    has_many :rush_comments, dependent: :destroy
    has_many :cpratings

    has_many :attendees, dependent: :destroy
    has_many :events, through: :attendees

    has_many :contacts, dependent: :destroy
    has_many :users, through: :contacts

    has_and_belongs_to_many :friends,
                          :class_name => "Rush",
                          :join_table => "friendships",
                          :foreign_key => "rush_id",
                          :association_foreign_key => "friend_id"

    has_many :photos, dependent: :destroy
    has_one :openrush



    validates :name, presence: true
    validates_uniqueness_of :name
    validates_uniqueness_of :phone, :allow_nil => true, :allow_blank => true
    #For now I got rid of phone validation in case we have no phone number
    #validates :phone, presence: true
    #validates_uniqueness_of :phone

    attr_reader :friend_tokens  
    
    def friend_tokens=(ids)  
        self.friend_ids = ids.split(",")  
    end  

    def attending_event?(event)
        self.attendees.find_by_event_id(event.id)
    end

    def attend_event!(event)
        self.attendees.create!(event_id: event.id, user_id: current_user.id)
    end

    def add_contact!(user)
        self.contacts.create!(user_id: user.id)
    end

    def is_contact?(user)
        self.contacts.find_by_user_id(user.id)
    end
end
