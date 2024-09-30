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

end
