class Customer < ApplicationRecord
	has_secure_password

	validates :email, uniqueness: true


	has_many :contacts
	has_many :interactions, through: :contacts

end
