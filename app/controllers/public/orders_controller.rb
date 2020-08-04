class Public::OrdersController < ApplicationController
	def thanks
		
	end

	def new
		@customer = current_customer
		@neworder = Order.new
	end

	def confirm
  		@order = Order.new(order_params)
  		render :new if @order.invalid?
	end

	def create
		@order = Order.new(order_params)
		@order.save
		redirect_to public_items_path
	end
	private
	def order_params
		params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
	end
end
