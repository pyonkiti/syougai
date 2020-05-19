class CreateUserkeys < ActiveRecord::Migration[5.2]

  def change
    create_table :userkeys do |t|
        t.string :userkey_cd,    null: false
        t.string :userkey_nm
        t.timestamps
        t.index  :userkey, unique: true
    end
  end

end
