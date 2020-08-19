class Admin::CustomersController < ApplicationController
	before_action :authenticate
	def index
		# Customerモデルの中のデータをすべて代入する
		# 論理削除したものも取得
		@customers = Customer.with_deleted

	end
	def user_restore
      @user =  Customer.only_deleted.find(params[:id]).restore
      redirect_to  admin_customers_path
  	end

	def show
		# indexで会員idを持たせてshowに移動している
		# その会員idのデータを見つける(findメソッドで)
		# params[:id]でデータベースから持たされたidのレコードを取得する
		@customers = Customer.with_deleted
		@customer = @customers.find(params[:id])
	end

	def edit
		@customers = Customer.with_deleted
		@customer = @customers.find(params[:id])
	end

	def update
		@customer = Customer.find(params[:id])
		@customer.update(customer_params)
		redirect_to admin_customer_path
	end

	def destroy
	    @customer = Customer.find(params[:id])
	    @customer.delete
	    redirect_to admin_customer_path
  	end

	private
	def customer_params
		params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted, :deleted_at)
	end
	def authenticate
  		redirect_to admin_session_path unless admin_signed_in?
	end
		# 論理削除のため
	  def user_admin
       @users = User.with_deleted　#変更
       if  current_user.admin == false
           redirect_to users_path
       else
           render action: "index"
       end
    end
end
