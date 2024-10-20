class Admin::LodgingDashboardsController < ApplicationController
  def index
  @lodging = Lodging.all
  end

  def show
  @lodging = Lodging.find(params[:id])
  @categories = @lodging.l_categories
  end

  def approved
  lodging = Lodging.find(params[:id])
  lodging.update(approved: true)
  flash[:success] = "投稿が承認されました。"
  redirect_to admin_lodging_dashboards_path
  end
  
  def edit
  @lodging = Lodging.find(params[:id])
  end

 def update
  lodging = Lodging.find(params[:id])
  lodging.update(lodging_params)
  redirect_to admin_lodging_dashboard_path(lodging.id)
 end

 def destroy
  lodging = Lodging.find(params[:id])
  lodging.destroy
  redirect_to admin_lodging_dashboards_path
 end
 
 private

 def lodging_params
  params.require(:lodging).permit(:lodging_name, :address, :phone_number, :home_page, category_ids: [])
 end

end
