class Public::CartItemsController < ApplicationController
	def index
		@carts = Cart_item.all
	end

	def create
		@cart = Cart.new(cart_params)
		@cart.save
		redirect_to public_cart_items_path
	end
	private
	def cart_params
		params.require(:cart).permit(:item_id, :customer_id, :amount)
	end
end
