class Cliente < ActiveRecord::Base
	belongs_to :usuario
	has_many :orcamentos
	has_many :agendas
	validates_presence_of :nome, :email, :telefone

end
