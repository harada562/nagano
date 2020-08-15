class Public::ItemsController < ApplicationController
	def top
		@item1 = Item.find(10)
		@item2 = Item.find(11)
		@item3 = Item.find(9)
	end

	def index
		@items = Item.all
	end

	def show
		@items = CartItem.new
		@item = Item.find(params[:id])
		@customer = current_customer
	end
end
