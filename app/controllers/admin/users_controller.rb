class Admin::UsersController < ApplicationController
     layout 'admin'
     before_action :authenticate_admin!

    def index
      @users = User.all
    end

    def withdraw
      @user = User.find(params[:id])
      @user.update(is_valid: false)
      reset_session
      redirect_to admin_root_path
    end

    #def destroy
        #@user = User.find(params[:id])
        #@user.destroy
        #redirect_to admin_dashboards_path, notice: 'ユーザーを削除しました。'
    #end
end