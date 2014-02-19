class CreateAgendas < ActiveRecord::Migration
  def change
    create_table :agendas do |t|
      t.date :data
      t.time :hora

      t.timestamps
    end
  end
end
