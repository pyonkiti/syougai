class ApplicationController < ActionController::Base

    # 自作ヘルパーを定義
    helper_method :current_user
    before_action :login_required

    private

    # セッションIDをキーにしてUserを読み込む
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    # セッションIDがnilの場合、login画面を表示
    def login_required
        #一時的に止める
        redirect_to login_url unless current_user
    end
end
