module SessionsHelper

	def admin_uids
        [
        '608428950', # 2 Brandon Krieger
        '519585436', # 21 Alex Yau
        '100000571522014', # 26 Jason Littman
        '1380120373', # 36 Mike Carajohn
        '1012833159' # 39 Zack Kleinbart
        ]
    end

	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def is_admin?
		admin_uids.include? current_user.uid
	end

end
