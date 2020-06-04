class Admin::UsersController < ApplicationController

    # 全てのアクションが実行される前に、admin権限がないユーザーであればログインできないようにする処理を実行
    # 一時的に止める
    before_action:require_admin


    def index
        @users = User.all.order(:id)

        # UserテーブルをCSV出力する
        respond_to do |f|
            f.html
            # UTF-8で出力
            f.csv { send_data @users.generate_csv, filename: 'user_utf8.csv' }
            # S-JISで出力
            #f.csv { send_data @users.generate_csv.encode(Encoding::Windows_31J, undef: :replace, row_sep: "\r\n", force_quotes: true), filename: 'user_sjis.csv' }
        end
    end

    # CSVデータをUserにインポート
    def import
        User.import(params[:file])
        redirect_to admin_users_url, notice: "ユーザーを追加しました"
    end

    def show
        @user = User.find(params[:id])
      end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を登録しました。"
        else
            render :new
        end
    end

    def update
        @user = User.find(params[:id])
    
        if @user.update(user_params)
            redirect_to admin_user_url(@user), notice: "ユーザー「#{@user.name}」を更新しました。"
        else
            render :edit
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to admin_user_url, notice: "ユーザー「#{@users.name}」を削除しました。"
    end

  private

  def user_params
    params.require(:user).permit(
        :syain_id,
        :name,
        :name_id,
        :admin,
        :password,
        :password_confirmation
    )
  end

  # admin権限がないユーザーであれば、ログインできないようにする
  def require_admin
    redirect_to root_url unless current_user.admin?
  end
end
