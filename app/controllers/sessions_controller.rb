class SessionsController < ApplicationController
  
    # セッションIDがnilの場合、ログイン画面に遷移する処理をスキップ
    # ログイン画面ではスキップしないと、正しいアカウントでcreateメソッドに入れない
    #一時的に止める
    skip_before_action :login_required

    def new
    end

    def create
        # Userをname_idで検索
        user = User.find_by(name_id: session_params[:name_id])
        
        # Userで検索された、name_idに該当するパスワードと、画面入力されたパスワードが一致するか確認
        if user&.authenticate(session_params[:password])
            session[:user_id] = user.id
            redirect_to root_path, notice: 'ログインしました。'
        else
            render :new
        end
    end

    def destroy
        # セッション情報を全てクリア
        reset_session
        redirect_to root_url, notice: 'ログアウトしました。'
    end

    private

    # セッション情報のストロングパラメータ
    def session_params
        params.require(:session).permit(:name_id, :password)
    end
end
