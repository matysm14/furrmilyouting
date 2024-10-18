class Admin::DashboardsController < ApplicationController
 def index
  @eatery = Eatery.all
 end

 def show
  @eatery = Eatery.find(params[:id])
  @categories = @eatery.categories
 end

 def approved
  eatery = Eatery.find(params[:id])
  eatery.update(approved: true)
  flash[:success] = "投稿が承認されました。"
  redirect_to admin_dashboards_path
 end

 def edit
  @eatery = Eatery.find(params[:id])
 end

 def update
  eatery = Eatery.find(params[:id])
  eatery.update(eatery_params)
  redirect_to admin_dashboard_path(eatery.id)
 end

 def destroy
  eatery = Eatery.find(params[:id])
  eatery.destroy
  redirect_to admin_dashboards_path
 end

 private

 def eatery_params
  params.require(:eatery).permit(:restaurant_name, :address, :phone_number, :home_page, category_ids: [])
 end

end
