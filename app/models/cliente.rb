class Cliente < ActiveRecord::Base
	belongs_to :usuario
	has_many :orcamentos
	has_many :agendas
	validates_presence_of :nome, :email, :telefone

	paginates_per 3


	def self.search(query)
		if query.present?
			where(['email ILIKE :query or
				nome ILIKE :query or
				celular ILIKE :query', query: "%#{query}%"])
		else
			scoped
		end
	end
end
