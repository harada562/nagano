class Public::AddressesController < ApplicationController
	def index
		@addresse = Addresse.new
		@addresses =  Addresse.all
	end

	def create
		@addresse = Addresse.new(addresse_params)
		@addresse.save
		redirect_to public_addresses_path
	end

	def edit
		@addresse = Addresse.find(params[:id])
	end

	def update
		@addresse = Addresse.find(params[:id])
		@addresse.update(addresse_params)
		redirect_to public_addresses_path
	end
	private
	def addresse_params
		params.require(:addresse).permit(:name, :address, :postal_code, :customer_id)
	end
end
