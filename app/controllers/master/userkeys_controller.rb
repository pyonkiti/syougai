class Master::UserkeysController < ApplicationController

    before_action :userkey_task, only: [:show, :edit, :update, :destroy]

    def index
        @userkeys = Userkey.all.order(:id)
    end
    
    def show
    end

    def new
        @userkey = Userkey.new
    end

    def create
        @userkey = Userkey.new(userkey_params)
        if @userkey.save
            redirect_to master_userkey_url(@userkey), notice: "ユーザーキーを登録しました。"
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @userkey.update(userkey_params)
            redirect_to master_userkeys_url, notice: "ユーザーキーを更新しました。"
        else
            render :edit
        end
    end

    def destroy
        @userkey.destroy
        redirect_to master_userkeys_url, notice: "ユーザーキーを削除しました。"
    end

    private

    def userkey_task
        @userkey = Userkey.find(params[:id])
    end
  
    def userkey_params
        params.require(:userkey).permit(:userkey_cd, :userkey_nm)
    end
end
