class Master::EndusersController < ApplicationController

    before_action :enduser_task, only: [:show, :edit, :update, :destroy]

    def index
        @endusers = Enduser.all.order(:enduser_cd)
    end

    def show
    end

    def new
        @enduser = Enduser.new
    end

    def create
        
        @enduser = Enduser.new(enduser_params)
        if @enduser.save
            redirect_to master_enduser_url(@enduser), notice: "エンドユーザーを登録しました。"
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @enduser.update(enduser_params)
            redirect_to master_endusers_url, notice: "エンドユーザーを更新しました。"
        else
            render :edit
        end
    end

    def destroy
        @enduser.destroy
        redirect_to master_endusers_url, notice: "エンドユーザーを削除しました。"
    end

    private

    def enduser_params
        params.require(:enduser).permit(:enduser_cd, :todofuken, :enduser_nm)
    end

    def enduser_task
        @enduser = Enduser.find(params[:id])
    end
end
