class Agenda < ActiveRecord::Base

	validates_presence_of :data, :hora 

end
