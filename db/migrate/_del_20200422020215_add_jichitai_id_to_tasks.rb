class AddJichitaiIdToTasks < ActiveRecord::Migration[5.2]

    # tasks(子)とJichitais(親)をjichitai_idで紐づける
    def up
        # 最初に全データをクリアしないと上手く紐付けが行われない
        # execute 'DELETE FROM tasks;'
        # add_reference :tasks, :jichitai, null: false, index: true
    end

    def down
        # remove_reference :tasks, :jichitai, index: true
    end

end
