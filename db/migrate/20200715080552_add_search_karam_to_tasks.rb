class AddSearchKaramToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :search_karam, :string
  end
end
