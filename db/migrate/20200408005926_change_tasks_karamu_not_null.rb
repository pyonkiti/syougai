class ChangeTasksKaramuNotNull < ActiveRecord::Migration[5.2]
  
  # Not Null制約をつける
  def change
    change_column_null :tasks, :dantai_kbn, false
    change_column_null :tasks, :jigyou_kbn, false
    change_column_null :tasks, :taiou_cd, false
    change_column_null :tasks, :del_flg, false
  end

end
