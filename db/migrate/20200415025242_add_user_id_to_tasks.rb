class AddUserIdToTasks < ActiveRecord::Migration[5.2]
  
    # tasks(子)とuser(親)をuser_idで紐づける
    def up
        # 最初に全データをクリアしないと上手く紐付けが行われない
        execute 'DELETE FROM tasks;'
        add_reference :tasks, :user, null: false, index: true
    end

    def down
        remove_reference :tasks, :user, index: true
    end

end
