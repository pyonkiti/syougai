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

#   def aaa
#     @abc = params[:q]
#     # binding.pry
#   end

  def index

    # current_user（現在ログインしているuserのid）に紐づくTaskテーブルを検索
    # @tasks = current_user.tasks.order(created_at: :desc)
    
    # Inner Joinしない場合の記述
    # @q = current_user.tasks.ransack(params[:q])

    # ransackで検索
    # Inner Joinしている
    @q = Task.joins(:enduser, :motouke, :userkey, :user)
                .select("tasks.*, endusers.enduser_nm, motoukes.motouke_nm, userkeys.userkey_cd, userkeys.userkey_nm, users.name, users.name_id")
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
        :userkey_id
        )
  end

  # セッションIDに該当するTaskを読み込む
  def set_task
    @task = Task.find(params[:id])
  end

end
