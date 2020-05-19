class CreateMotoukes < ActiveRecord::Migration[5.2]
  def change

    # 元請けマスタを作成
    create_table :motoukes do |t|
        t.integer   :motouke_cd,    null: false
        t.string    :motouke_nm,    null: false
        t.timestamps
        t.index :motouke_cd, unique: true
    end
  end
end
