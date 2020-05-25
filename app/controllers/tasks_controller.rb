class TasksController < ApplicationController

  before_action :set_task, only: [:show, :edit, :update, :destroy]

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
    # ransack未使用
    # @tasks = current_user.tasks.order(created_at: :desc)
    
    # Inner Joinしない場合の記述
    # @q = current_user.tasks.ransack(params[:q])

    # ransackで検索
    # 2テーブルをInner Joinしている
    @q = current_user.tasks.joins(:enduser, :motouke, :userkey)
                .select("tasks.*, endusers.enduser_nm, motoukes.motouke_nm, userkeys.userkey_cd, userkeys.userkey_nm")
                .where(del_flg: 0)
                .order({renraku_d: :desc}, {renraku_t: :desc}, {id: :desc})
                .ransack(params[:q])
    @tasks = @q.result(distinct: true)

    # binding.pry
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    
    @task = current_user.tasks.new(task_params)
    if @task.save
        redirect_to @task, notice: "障害情報を登録しました。"
    else
        render :new
    end
  end

  def edit
  end

  def update
    @task.update!(task_params)
    redirect_to tasks_url, notice: "障害情報を更新しました。"
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
        :enduser_id,
        :motouke_id,
        :userkey_id
        )
  end

  # セッションIDに該当するTaskを読み込む
  def set_task
    @task = current_user.tasks.find(params[:id])
  end

end
