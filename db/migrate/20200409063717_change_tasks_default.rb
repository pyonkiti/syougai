class ChangeTasksDefault < ActiveRecord::Migration[5.2]
    
    # デフォルト値をつける
    def up
        change_column_default :tasks, :syanai, 0
        change_column_default :tasks, :sagyoukei, 0
        change_column_default :tasks, :idou, 0
        change_column_default :tasks, :teishi, 0
        change_column_default :tasks, :del_flg, 0
    end
    
    # デフォルト値を削除
    def down
        change_column_default :tasks, :syanai, nil
        change_column_default :tasks, :sagyoukei, nil
        change_column_default :tasks, :idou, nil
        change_column_default :tasks, :del_flg, nil
        change_column_default :tasks, :teishi, nil
    end
end
