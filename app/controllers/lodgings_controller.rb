class LodgingsController < ApplicationController
  def new
    @lodging = Lodging.new
  end
  
  def create
    @lodging = Lodging.new(lodging_params)
    @lodging.user_id = current_user.id
    @lodging.save
    redirect_to user_path(current_user)
  end

  def show
  end
  
  private

  def lodging_params
    params.require(:lodging).permit(:lodging_name, :address, :phone_number, :home_page, category_ids: [])
  end
  
end
