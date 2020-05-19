class AddUserkeyIdToTasks < ActiveRecord::Migration[5.2]

  # tasks(子)とUserkey(親)をuserkey_idで紐づける
  def up
    # 最初に全データをクリアしないと上手く紐付けが行われない
    execute 'DELETE FROM tasks;'
    add_reference :tasks, :userkey, null: false, index: true
end

def down
    remove_reference :tasks, :userkey, index: true
end

end
