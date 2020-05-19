class CreateKigyous < ActiveRecord::Migration[5.2]
  def change
    
    # 企業マスタを作成
    create_table :kigyous do |t|
        t.integer :enduser_cd,  null: false
        t.string :kigyou_nm,    null: false
        t.index :enduser_cd, unique: true
        t.timestamps
    end
  end
end
