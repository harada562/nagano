class Public::OrdersController < ApplicationController
	def thanks
	end

	def index
		@orders = current_customer.orders
		@items = @ordre
	end

	def new
		@order = Order.new
		# @address = Addresse.new
		@customer = current_customer
	end

	def confirm
		@order = Order.new(order_params)
		@customer = current_customer
		@add = params[:add].to_i
	    if @add == 1
	          @order.postal_code = current_customer.postal_code
	          @order.address = current_customer.address
	          @order.name = current_customer.first_name + current_customer.last_name
	   elsif @add == 2
	    	  @address = Addresse.find(params[:order][:id])
	          @order.postal_code = @address.postal_code
	          @order.address =  @address.address
	          @order.name =  @address.name
	    elsif @add == 3
	    	# @addresse = Addresse.new(addresse_params)
	    end
		return if @order.valid?
		render :new
	end

	def back
		@order = Order.new(order_params)
		@customer = current_customer
    	render :new
	end


	def create
		@order = Order.new(order_params)
		@add = params[:add].to_i
	    if @add == 1
	          @order.postal_code = current_customer.postal_code
	          @order.address = current_customer.address
	          @order.name = current_customer.first_name + current_customer.last_name
	    elsif @add == 2
	    	  @address = Addresse.find(@order.address)
	          @order.postal_code = @address.postal_code
	          @order.address =  @address.address
	          @order.name =  @address.name
	    elsif @add == 3
	    end
		@order.save
		redirect_to complete_public_orders_path
	end

	def show
		@order = Order.find(params[:id])
		
	end
	def complete
	end
	private
	def order_params
		params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :status)
	end
end