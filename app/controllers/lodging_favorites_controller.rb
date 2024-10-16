class LodgingFavoritesController < ApplicationController

  def create
    lodging = Lodging.find(params[:lodging_id])
    favorite = current_user.lodging_favorites.new(lodging_id: lodging.id)
    favorite.save
    redirect_to lodging_path(lodging)
  end

  def destroy
    lodging = Lodging.find(params[:lodging_id])
    favorite = current_user.lodging_favorites.find_by(lodging_id: lodging.id)
    favorite.destroy
    redirect_to lodging_path(lodging)
  end

end
