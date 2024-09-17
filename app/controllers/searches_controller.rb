class SearchesController < ApplicationController
  before_action :authenticate_user!

	def search
		@model = params[:model]
		@content = params[:content]
		@method = params[:method]
		if @model == 'eatery'
			@records = Eatery.search_for(@content, @method)
		else
			@records = Lodging.search_for(@content, @method)
		end
	end
end
