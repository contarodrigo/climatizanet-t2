class RemovePasswordFromUsuarios < ActiveRecord::Migration
  def change
    remove_column :usuarios, :password, :string
  end
end
