class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
	#Nessa classe há umaclass macro bastante importante, protect_from_forgery. Essa macro
	#faz com que todos os controles da aplicação exijam uma chave de autenticação em
	#ações de alteração de dados (create, updateedestroy) de modo a evitar ataques
	#de falsi!cação de requisição (Request Forgery). Portanto, é bastante importante
	#deixá-la ativada sempre que possível.
  protect_from_forgery with: :exception
end
