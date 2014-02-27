class RemoveColumns < ActiveRecord::Migration
	def self.up
	  remove_column :usuarios, :senha
	end

	def self.down
	  add_column :usuarios, :password, :string
	end
end
