class Usuario < ActiveRecord::Base
	EMAIL_REGEXP=/\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

	validates_presence_of :nome, :email

	#validates_confirmation_of :senha,
	# o has_secure_password ja faz as valadoes porem temos que mudar o nome do atributo para password
	has_secure_password


	validates_uniqueness_of :email

	validate :email_format


	private

	#validacao para o formato do email conforme expressao regular EMAIL_REGEXP
	def email_format
		errors.add(:email, :invalid) unless email.match(EMAIL_REGEXP)
	end
end
