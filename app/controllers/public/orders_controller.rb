class Public::OrdersController < ApplicationController
	def thanks
	end

	def new
		@order = Order.new
		@addresses = Addresse.all
	end

	def create
		@order = Order.new(order_params)
		@order.save
		redirect_to public_items_path
	end
	private
	def order_params
		params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :status)
	end
end
