class Cliente < ActiveRecord::Base
	belongs_to :usuario
	has_many :orcamentos
	has_many :agendas
	validates_presence_of :nome, :email, :telefone


	def self.search(query)
		if query.present?
			where(['email LIKE :query or
				nome LIKE :query or
				celular LIKE :query', query: "%#{query}%"])
		else
			scoped
		end

	end

end
