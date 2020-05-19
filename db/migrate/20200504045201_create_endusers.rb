class CreateEndusers < ActiveRecord::Migration[5.2]
  def change

    # エンドユーザーマスタを作成
    create_table :endusers do |t|
        t.integer :enduser_cd,    null: false
        t.string  :todofuken
        t.string  :enduser_nm,    null: false
        t.timestamps
        t.index :enduser_cd, unique: true
    end
  end
end
