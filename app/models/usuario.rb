class Usuario < ActiveRecord::Base
	EMAIL_REGEXP=/\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	validates_presence_of :nome, :email, :senha

	validates_confirmation_of :senha

	validates_uniqueness_of :email

	validate :email_format
	private
	def email_format
		errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
	end


end
