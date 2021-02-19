class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]
  
  # 折れ線グラフ表示（x:連絡年月 y:発生件数）
  def graph1

    _sql   = "Select to_char(renraku_d, 'YYYY/MM') As renraku_ym, "
    _sql  += "Count(to_char(renraku_d, 'YYYY/MM')) As renraku_cn "
    _sql  += "From tasks Where (renraku_d is not null) "
    _sql  += "Group by renraku_ym Order by renraku_ym"

    @ary = []

    # SQL文を直接実行
    @grp =  ActiveRecord::Base.connection.select_all(_sql)
    @grp.each do | row |
        _ary2 = []
        _ary2 << row["renraku_ym"].to_s
        _ary2 << row["renraku_cn"].to_s
        @ary  << _ary2
    end

    # logger.debug("#{@ary}")
    # Rails.application.config.deb_logger.debug(@ary)
  end

  # 横棒グラフ表示（x:ユーザー y:発生件数）
  def graph2

    _sql   = "Select en.enduser_nm As enduser_nm_gr, "
    _sql  += "Count(en.enduser_nm) As enduser_nm_cn "
    _sql  += "From tasks As ta Left Join endusers As en On ta.enduser_id = en.id "
    _sql  += "Where (en.enduser_nm is not null) "
    _sql  += "Group by enduser_nm_gr Order by enduser_nm_cn DESC"

    @ary = []

    @grp =  ActiveRecord::Base.connection.select_all(_sql)
    @grp.each do | row |
        _ary2 = []
        _ary2 << row["enduser_nm_gr"].to_s
        _ary2 << row["enduser_nm_cn"].to_s
        @ary  << _ary2
    end

    # Rails.application.config.deb_logger.debug(@ary)
  end

  # Excel出力
  def excel

    @tasks = Task.joins(:enduser, :motouke, :userkey, :user)
                .select("tasks.*, endusers.enduser_nm, motoukes.motouke_nm, userkeys.userkey_cd, userkeys.userkey_nm, users.name, users.name_id")
                .where(del_flg: 0).order(id: :asc)
    respond_to do |format|
      format.xlsx do
        response.headers['Content-Disposition'] = 'attachment; filename="障害情報.xlsx"'
      end
    end
  end

  # 自治体でセレクトボックスが選択された時
  def search

    @enduser = Enduser.where(todofuken: params[:keyword])
    render json: @enduser
    # binding.pry
  end

  # 民間でセレクトボックスが選択された時
  def search_mkn

    @enduser_mkn = Enduser.where('enduser_cd < 1000').order('enduser_cd')
    render json: @enduser_mkn
  end

  def index
    
    # current_user（現在ログインしているuserのid）に紐づくTaskテーブルを検索
    # @tasks = current_user.tasks.order(created_at: :desc)
    
    # Inner Joinしない場合の記述
    # @q = current_user.tasks.ransack(params[:q])

    # ransackで検索
    # Left Joinしている
    @q = Task.joins(:enduser, :motouke, :userkey, :user)
                .select("tasks.*, endusers.enduser_nm, motoukes.motouke_nm, userkeys.userkey_cd, userkeys.userkey_nm, users.name, users.name_id")
                .where(del_flg: 0)
                .order({renraku_d: :desc}, {renraku_t: :desc}, {id: :desc})
                .ransack(params[:q])
                @tasks = @q.result(distinct: true).page(params[:page]).per(20)
    
    # binding.pry
    # puts "テストindex"
    

  end

  def show
  end

  def new
    @task = Task.new
    @task.taiou_cd = current_user.syain_id              #ログインユーザーを初期表示
  end

  def create
    
    @task = Task.new(task_params)
    if @task.save
        redirect_to @task, notice: "障害情報を登録しました。"
    else
        render :new
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
        upd_task
        redirect_to tasks_url, notice: "障害情報を更新しました。"
    else
        render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_url, notice: "障害情報を削除しました。"
  end

  private

  # ストロングパラメータ
  def task_params
    params.require(:task).permit(
        :dantai_kbn, 
        :todofuken,
        :jigyou_kbn,
        :kijyou,
        :naiyou, 
        :jisyou,
        :syochi,
        :biko,
        :syubetu_kbn, 
        :hosyou_kbn, 
        :renraku_d, 
        :renraku_t, 
        :syanai,
        :genchi_d,
        :genchi_t,
        :sagyou_d, 
        :sagyou_t,
        :syagai,
        :idou, 
        :teishi,
        :project_cd,
        :taiou_cd, 
        :taiou_sub,
        :del_flg,
        :user_id,
        :enduser_id,
        :motouke_id,
        :userkey_id,
        :search_karam,
        :remote_kbn,
        :remote_sagyou_ts,
        :remote_sagyou_te,
        :remote_jiyu_kbn,
        :remote_jiyu_sonota,
        :remote_syori_kbn,
        :remote_syori_sonota,
        :remote_kojin_kbn,
        :remote_syousai
        )
  end

  # セッションIDに該当するTaskを読み込む
  def set_task
    @task = Task.find(params[:id])
  end
  
  # 横断検索項目を更新する
  def upd_task

    @task = Task.joins(:motouke, :enduser, :userkey)
                .select("tasks.*","endusers.enduser_nm","motoukes.motouke_nm","userkeys.userkey_cd")
                .find(params[:id])

    _search_karam  = "#{(@task.todofuken).chomp}"           + ","
    _search_karam += "#{(@task.kijyou).chomp}"              + ","
    _search_karam += "#{(@task.naiyou).chomp}"              + ","
    _search_karam += "#{(@task.jisyou).chomp}"              + ","
    _search_karam += "#{(@task.syochi).chomp}"              + ","
    _search_karam += "#{(@task.biko).chomp}"                + ","
    _search_karam += "#{(@task.project_cd).chomp}"          + ","
    _search_karam += "#{(@task.taiou_cd).to_s.chomp}"       + ","
    _search_karam += "#{(@task.taiou_sub).chomp}"           + ","
    _search_karam += "#{(@task.enduser_nm).chomp}"          + ","
    _search_karam += "#{(@task.motouke_nm).chomp}"          + ","
    _search_karam += "#{(@task.userkey_cd).chomp}"          + ","
    
    # 入力不可項目はサーバーに送信されないためnilが入る
    # nil.chompをするとエラーになる対応
    _search_karam += "#{((@task.remote_jiyu_kbn).nil? ? "": @task.remote_jiyu_kbn).chomp}"         + ","
    _search_karam += "#{((@task.remote_jiyu_sonota).nil? ? "": @task.remote_jiyu_sonota).chomp}"   + ","
    _search_karam += "#{((@task.remote_syori_kbn).nil? ? "": @task.remote_syori_kbn).chomp}"       + ","
    _search_karam += "#{((@task.remote_syori_sonota).nil? ? "": @task.remote_syori_sonota).chomp}" + ","
    _search_karam += "#{((@task.remote_syousai).nil? ? "": @task.remote_syousai).chomp}"
    
    @task.update(search_karam: _search_karam)
  end
end
