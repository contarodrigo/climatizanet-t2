class Agenda < ActiveRecord::Base

	belongs_to :cliente

	validates_presence_of :data, :hora 

end
