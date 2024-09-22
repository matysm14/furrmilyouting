class SearchesController < ApplicationController
  before_action :authenticate_user!

	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'eatery'
			@eatery_records = Eatery.where(approved: true).search_for(@content, @method)
		elsif @model == 'lodging'
			@lodging_records = Lodging.search_for(@content, @method)
		else
			@eatery_records = Eatery.where(approved: true)
			@lodging_records = Lodging.all
		end
	end

end
