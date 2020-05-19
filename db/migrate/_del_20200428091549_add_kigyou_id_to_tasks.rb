class AddKigyouIdToTasks < ActiveRecord::Migration[5.2]

  # tasks(子)とKigyous(親)をkigyou_idで紐づける
  def up
    # 最初に全データをクリアしないと上手く紐付けが行われない
    # execute 'DELETE FROM tasks;'
    # add_reference :tasks, :kigyou, null: false, index: true
    end

    def down
        # remove_reference :tasks, :kigyou, index: true
    end

end
