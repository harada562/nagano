class Public::OrdersController < ApplicationController
	def thanks
	end

	def new
		@order = Order.new
		@address = Addresse.all
		@customer = current_customer
	end

	def confirm
		@order = Order.new(order_params)
		@cart_items = current_customer.cart_items
		@add = params[:order][:add].to_i
	      case @add
	        when 1
	          @order.postal_code = @customer.post_code
	          @order.send_to_address = @customer.address
	          @order.addressee = full_name(@customer)
	        when 2
	          @order.post_code = params[:order][:post_code]
	          @order.send_to_address = params[:order][:send_to_address]
	          @order.addressee = params[:order][:addresse]
	        when 3
	          @order.post_code = params[:order][:post_code]
	          @order.send_to_address = params[:order][:send_to_address]
	          @order.addressee = params[:order][:addressee]
	    end
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
