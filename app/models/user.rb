# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  hashed_password :string(255)
#  salt            :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  admin           :boolean         default(FALSE)
#  email           :string(255)
#

require 'digest/sha2'

class User < ActiveRecord::Base
attr_accessible :name, :email, :admin, :password, :password_confirmation
after_destroy :ensure_an_admin_remains

	email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :name, :presence => true, :uniqueness => true
	validates :email, 
				:presence => true, 
				:uniqueness => { :case_sensitive => false }, 
				:format   => { :with => email_regex }

	validates :password, :confirmation => true
	attr_accessor :password_confirmation
	attr_reader :password

  	# Automatically create the virtual attribute 'password_confirmation'.
  	validates :password, :presence     => true,
                       	:confirmation => true,
                       	:length       => { :within => 6..40 }

	validate :password_must_be_present

	def User.authenticate(name, password)
		if user = find_by_name(name)
			if user.hashed_password == encrypt_password(password, user.salt)
				user
			end
		end
	end

	
# 'password' is a virtual attribute
	def password=(password)
		@password = password
		if password.present?
			generate_salt
			self.hashed_password = self.class.encrypt_password(password, salt)
		end
	end

private

	def password_must_be_present
		errors.add(:password, "Missing password" ) unless hashed_password.present?
	end

	def generate_salt
		self.salt = self.object_id.to_s + rand.to_s
	end

	def User.encrypt_password(password, salt)
		Digest::SHA2.hexdigest(password + "wibble" + salt)
	end

	def User.derypt_password(hashed_password, salt)
		#
	end

# don't delete last user

	def ensure_an_admin_remains
		if User.count.zero?
		raise "Can't delete last user"
		end
	end

	
end
