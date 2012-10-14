# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  email          :string(255)
#  phone          :string(255)
#  uid            :string(255)
#  token          :string(255)
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  remember_token :string(255)
#

class User < ActiveRecord::Base
    attr_accessible :created_at, :email, :name, :phone, :uid, :token, :remember_token, :updated_at

    before_save :create_remember_token

    def self.create_with_omniauth(auth)
  		create! do |user|
    	user.uid = auth["uid"]
    	user.token = auth["credentials"]["token"]
    	user.name = auth["info"]["name"]
    	user.email = auth["info"]["email"]
    	user.phone = auth["info"]["phone"]
  		end	
	end

	private
		def create_remember_token
			self.remember_token = SecureRandom.urlsafe_base64
		end
end
