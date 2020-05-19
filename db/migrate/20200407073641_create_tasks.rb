class CreateTasks < ActiveRecord::Migration[5.2]
  
    def change

        # 障害テーブルを作成
        create_table :tasks do |t|
            t.integer :dantai_kbn
            t.string :todofuken
            t.integer :jigyou_kbn
            t.string :kijyou
            t.text :naiyou
            t.text :jisyou
            t.text :syochi
            t.text :biko
            t.string :syubetu_kbn
            t.string :hosyou_kbn
            t.date :renraku_d
            t.time :renraku_t
            t.float :syanai
            t.date :genchi_d
            t.time :genchi_t
            t.date :sagyou_d
            t.time :sagyou_t
            t.float :syagai
            t.float :idou
            t.float :teishi
            t.string :project_cd
            t.integer :taiou_cd
            t.integer :taiou_sub
            t.integer :del_flg

            t.timestamps
        end
  end
end
