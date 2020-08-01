class Admin::OrdersController < ApplicationController
	def top
	end

	def index
		@orders = Order.all
	end
end
