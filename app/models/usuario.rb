class Usuario < ActiveRecord::Base
	EMAIL_REGEXP=/\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
	scope :registro_valido, -> {where.not(email: nil) }


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

	#self.authenticate é um método criado propio da classe, ja authenticate serve para verificar cm excluisividade a senha
	def self.authenticate(email, password)
		usuario = registro_valido.find_by(email: email)

		if usuario.present?
			usuario.authenticate(password)
		else
			false
		end
	end

end
