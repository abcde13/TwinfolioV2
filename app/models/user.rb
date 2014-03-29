class User < ActiveRecord::Base
	
	validates_presence_of :username,:password

	before_save :encrypt_password
	after_save :clear_password

	def encrypt_password
		if password.present?
			self.salt = BCrypt::Engine.generate_salt
			self.epassword = BCrypt::Engine.hash_secret(password, salt)
		end
	end

	def clear_password
		self.password = nil
	end

	def self.authenticate(username, pxx)
		user = User.find_by_username(username)
		if(user && user.match_password(pxx))
			return user
		else
			return false
		end
	end

	def match_password(pxx)
		epassword == BCrypt::Engine.hash_secret(pxx,salt)
	end
end
