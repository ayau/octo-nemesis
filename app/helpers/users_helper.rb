module UsersHelper

	def getPictureForName(user_token,rush_name)
        graph = Koala::Facebook::GraphAPI.new(user_token)
        facebook_friends = graph.get_connections("me", "friends", :fields =>"name,picture.type(large)")
        facebook_friends.each do |fa|
            if (fa["name"].downcase == rush_name.downcase)
                return fa["picture"]["data"]["url"]
            end
        end

        Return blank string if not friends
        return ""
    end

end
