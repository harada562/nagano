class Public::CartItemsController < ApplicationController
	def index
		@carts = current_customer.cart_items.all
		@cart = CartItem.new
	end

	def create
		@cart = CartItem.new(cart_params)
		@cart.save
		redirect_to public_cart_items_path
	end

	def update
		@cart = CartItem.find(params[:id])
		@cart.update(cart_params)
		redirect_to public_cart_items_path(@cart.id)
	end

	def destroy
		@cart_item = CartItem.find(params[:id])
      	@cart_item.destroy
      	redirect_to public_items_path
	end

	def destroy_all #カート内アイテム全部消去
    current_customer.cart_items.destroy_all
    redirect_to root_path
    flash[:info] = 'カートを空にしました。'
  end

	private
	def cart_params
		params.require(:cart_item).permit(:item_id, :customer_id, :amount)
	end
end
