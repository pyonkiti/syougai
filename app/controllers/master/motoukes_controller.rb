class Master::MotoukesController < ApplicationController
    
    before_action :motouke_task, only: [:show, :edit, :update, :destroy]

    def index
        @motoukes = Motouke.all.order(:id)
    end

    def show
    end

    def new
        @motouke = Motouke.new
        get_motouke_max
        
        # binding.pry
    end

    def create
        
        @motouke = Motouke.new(motouke_params)
        if @motouke.save
            redirect_to master_motouke_url(@motouke), notice: "元請けを登録しました。"
        else
            get_motouke_max
            render :new
        end
    end

    def edit
    end

    def update
        if @motouke.update(motouke_params)
            redirect_to master_motoukes_url, notice: "元請けを更新しました。"
        else
            render :edit
        end
    end

    def destroy
        @motouke.destroy
        redirect_to master_motoukes_url, notice: "元請けを削除しました。"
    end

    private

    def motouke_params
        params.require(:motouke).permit(:motouke_cd, :motouke_nm)
    end

    def motouke_task
        @motouke = Motouke.find(params[:id])
    end

    # 元請けコードのMAX+1を求める
    def get_motouke_max
        @motouke_max = Motouke.maximum("motouke_cd")
        @motouke_max = 0 if @motouke_max.nil?
        @motouke_max = @motouke_max.to_i + 1
    end
end
