class Admin::LodgingDashboardsController < ApplicationController
  def index
  @lodging = Lodging.all
  end
  
  def show
  @lodging = Lodging.find(params[:id])
  #@categories = @lodging.categories
  end
 
end
