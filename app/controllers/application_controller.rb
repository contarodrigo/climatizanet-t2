#encoding:utf-8
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	#Nessa classe há umaclass macro bastante importante, protect_from_forgery. Essa macro
	#faz com que todos os controles da aplicação exijam uma chave de autenticação em
	#ações de alteração de dados (create, updateedestroy) de modo a evitar ataques
	#de falsi!cação de requisição (Request Forgery). Portanto, é bastante importante
	#deixá-la ativada sempre que possível.
  protect_from_forgery with: :exception

  #disponibiliza metodos para todos os controler
  delegate :usuario_corrente, :usuario_logado?, to: :user_session

  #disponibiliza metodos para as view
  helper_method :usuario_corrente, :usuario_logado?

  	def user_session
		UserSession.new(session)
	end

	def require_authentication
		unless usuario_logado?
			redirect_to new_user_sessions_path, alert: 'Você precisa estar logado para continuar'
		end
	end

	def require_no_authentication
		if usuario_logado?
			redirect_to root_path, notice: 'Você já está logado'
		end
	end

end
