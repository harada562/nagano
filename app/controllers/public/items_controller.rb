class Public::ItemsController < ApplicationController
	def top
		@items = Item.all
	end

	def index
		@items = Item.all
	end

	def show
		@item = Item.find(params[:id])
	end
end
