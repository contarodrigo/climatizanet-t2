class Equipamento < ActiveRecord::Base

	belongs_to :usuario

	validates_presence_of :descricao

	validates_uniqueness_of :descricao
end
