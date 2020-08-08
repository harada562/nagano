class Public::OrdersController < ApplicationController
	def thanks
	end

	def new
		@order = Order.new
		@address = Addresse.all
		@customer = current_customer
	end


	def create
		@order = Order.new(order_params)
		@add = params[:add].to_i
	    if @add == 1
	          @order.postal_code = current_customer.postal_code
	          @order.address = current_customer.address
	          @order.name = current_customer.first_name
	    elsif @add == 2
	    	  @address = Addresse.find(@order.address)
	          @order.postal_code = @address.postal_code
	          @order.address =  @address.address
	          @order.name =  @address.name
	    elsif @add == 3
	          # @order.postal_code = params[:order][:postal_code]
	          # @order.address = params[:order][:address]
	          # @order.name = params[:order][:name]
	    end
		@order.save
		redirect_to public_items_path
	end
	private
	def order_params
		params.require(:order).permit(:customer_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :status)
	end
end

	# def confirm
	# 	@order = Order.new
	# 	@cart_items = current_customer.cart_items
	# 	@add = params[:order][:add].to_i
	#       case @add
	#         when 1
	#           @order.postal_code = current_customer.postsl_code
	#           @order.address = current_customer.address
	#           @order.name = current_customer.first_name
	#         when 2
	#           @order.post_code = params[:order][:post_code]
	#           @order.address = params[:order][:address]
	#           @order.name = params[:order][:name]
	#         when 3
	#           @order.post_code = params[:order][:post_code]
	#           @order.address = params[:order][:address]
	#           @order.name = params[:order][:name]
	#     end
	# 	@cart_items = current_customer.cart_items!
	#     redirect_to complete_public_orders_path(@order,@add,@cart_items)
	# end

	# def complete
	# 	@order = Order.new
	# 	@cart_items = current_customer.cart_items
	# 	@add = params[:order][:add].to_i
	#       case @add
	#         when 1
	#           @order.postal_code = current_customer.post_code
	#           @order.address = current_customer.address
	#           @order.name = current_customer.first_name
	#         when "2"
	#         # params[:order][:post_code]はストロングパロメータorderのpost_codeということ
	#           @order.post_code = params[:order][:post_code]
	#           @order.address = params[:order][:address]
	#           @order.name = params[:order][:name]
	#         when "3"
	#           @order.post_code = params[:order][:post_code]
	#           @order.address = params[:order][:address]
	#           @order.name = params[:order][:name]
	#     end
	# end