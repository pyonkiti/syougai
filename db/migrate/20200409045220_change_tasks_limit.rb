class ChangeTasksLimit < ActiveRecord::Migration[5.2]

    # カラムの長さを指定
    def up
        change_column :tasks, :kijyou, :string, limit: 50
    end

    def down
        change_column :tasks, :kijyou, :string
    end
end
