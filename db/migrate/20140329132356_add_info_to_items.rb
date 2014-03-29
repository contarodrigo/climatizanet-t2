class AddInfoToItems < ActiveRecord::Migration
  def change
    add_column :items, :info, :string
  end
end
