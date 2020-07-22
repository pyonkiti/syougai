# rails runner ./lib/tasks/proc_tasks.rbで実行
class Proc_Tasks

    # tasksテーブルのsearch_karamをコンバート
    def self.convert_tasks
        count = 0
        ret = Task.find_by_sql('Select * From Tasks Order By id')

        ret.each do |rec| 
            @task = Task.joins(:motouke, :enduser, :userkey)
                    .select("tasks.*","endusers.enduser_nm","motoukes.motouke_nm","userkeys.userkey_cd")
                    .find(rec['id'].to_i)

            _search_karam  = "#{(@task.todofuken).chomp}"     + ","
            _search_karam += "#{(@task.kijyou).chomp}"        + ","
            _search_karam += "#{(@task.naiyou).chomp}"        + ","
            _search_karam += "#{(@task.jisyou).chomp}"        + ","
            _search_karam += "#{(@task.syochi).chomp}"        + ","
            _search_karam += "#{(@task.biko).chomp}"          + ","
            _search_karam += "#{(@task.project_cd).chomp}"    + ","
            _search_karam += "#{(@task.taiou_cd).to_s.chomp}" + ","
            _search_karam += "#{(@task.taiou_sub).chomp}"     + ","
            _search_karam += "#{(@task.enduser_nm)}"          + ","
            _search_karam += "#{(@task.motouke_nm).chomp}"    + ","
            _search_karam += "#{(@task.userkey_cd).chomp}"

            # 事故で実行されないようにコメント
            @task.update(search_karam: _search_karam)     
            count += 1
        end
        puts "処理が完了しました。更新件数: #{count}"
        # puts "テスト。更新件数: #{count}"
    end
end

Proc_Tasks.convert_tasks

