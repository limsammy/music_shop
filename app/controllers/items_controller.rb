class ItemsController < ApplicationController

	def index
		@items = Item.all
    @repositories = Settings.repositories ||= []
	end

	def show
		@item = Item.find(params[:id])
    @audio = @item.audio
	end

end
