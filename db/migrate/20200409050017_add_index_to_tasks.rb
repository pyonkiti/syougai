class AddIndexToTasks < ActiveRecord::Migration[5.2]
    # インデックスを追加
    def change
        add_index :tasks, :dantai_kbn
        add_index :tasks, :motouke_id
        add_index :tasks, :enduser_id
        add_index :tasks, :naiyou
        add_index :tasks, :renraku_d
        add_index :tasks, :sagyou_d
        add_index :tasks, :taiou_cd
        add_index :tasks, :project_cd
    end
end
