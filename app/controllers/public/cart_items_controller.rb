class Public::CartItemsController < ApplicationController
	def index
		@carts = CartItem.all
	end

	def create
		@cart = CartItem.new(cart_params)
		@cart.save
		redirect_to public_cart_items_path
	end

	def update
		@curt = CurtItem.find(params[:id])
		@curt.update(customer_params)
		redirect_to public_curt_item_path
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
