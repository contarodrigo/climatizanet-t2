class Equipamento < ActiveRecord::Base

	belongs_to :usuario

	validates_presence_of :descricao

	validates_uniqueness_of :descricao

	def self.search(query)
		if query.present?
			where(['descricao ILIKE :query ', query: "%#{query}%"])
		else
			scoped
		end
	end
end
