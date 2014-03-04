#encoding:utf-8
class UserSession
	include ActiveModel::Model

	attr_accessor :email, :password
	validates_presence_of :email, :password

	def initialize(session, attributes={})
		@session = session
		@email = attributes[:email]
		@password = attributes[:password]
	end

	def authenticate!
		usuario = Usuario.authenticate(@email, @password)

		if usuario.present?
			store(usuario)
		else
			errors.add(:base, 'Usuário ou senha inválidos')
			false
		end
	end

	def store(usuario)
		@session[:usuario_id] = usuario.id
	end

	def usuario_corrente
		Usuario.find(@session[:usuario_id])
	end

	def usuario_logado?
		@session[:usuario_id].present?
	end

	def destroy
		@session[:usuario_id] = nil
	end


end
