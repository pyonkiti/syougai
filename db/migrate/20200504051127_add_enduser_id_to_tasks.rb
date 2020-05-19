class AddEnduserIdToTasks < ActiveRecord::Migration[5.2]
  
    # tasks(子)とEnduser(親)をenduser_idで紐づける
    def up
        # 最初に全データをクリアしないと上手く紐付けが行われない
        execute 'DELETE FROM tasks;'
        add_reference :tasks, :enduser, null: false, index: true
    end

    def down
        remove_reference :tasks, :enduser, index: true
    end

end
