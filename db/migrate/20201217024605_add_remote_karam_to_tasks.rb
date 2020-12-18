class AddRemoteKaramToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :remote_kbn,          :string, default:'0', null: false
    add_column :tasks, :remote_sagyou_ts,    :time
    add_column :tasks, :remote_sagyou_te,    :time
    add_column :tasks, :remote_jiyu_kbn,     :string
    add_column :tasks, :remote_jiyu_sonota,  :string
    add_column :tasks, :remote_syori_kbn,    :string
    add_column :tasks, :remote_syori_sonota, :string
    add_column :tasks, :remote_kojin_kbn,    :string, default:'0', null: false
    add_column :tasks, :remote_syousai,      :text
  end
end
