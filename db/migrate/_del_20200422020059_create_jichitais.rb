class CreateJichitais < ActiveRecord::Migration[5.2]
  def change

    # 自治体マスタを作成
    create_table :jichitais do |t|
        t.integer :enduser_cd, null: false
        t.string :todofuken,   null: false
        t.string :sikutyou,    null: false
        t.timestamps
        t.index :enduser_cd, unique: true
      t.timestamps
    end

end
end
