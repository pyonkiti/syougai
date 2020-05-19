class AddMotoukeIdToTasks < ActiveRecord::Migration[5.2]
  
    # tasks(子)とMotoukes(親)をmotouke_idで紐づける
    def up
        # 最初に全データをクリアしないと上手く紐付けが行われない
        execute 'DELETE FROM tasks;'
        add_reference :tasks, :motouke, null: false, index: true
    end

    def down
        remove_reference :tasks, :motouke, index: true
    end

end
