class Admin::OrderDetailsController < ApplicationController

	private
	def order_detail_params
		params.require(:order_detail).permit(
			:order_id, :item_id, :amount, :price, :make_status)
	end
end
