Rails.application.routes.draw do

	root 'public/items#top'
  	get 'home/about', to:'homes#about'

  	devise_for :admins
  	devise_for :customers

  	namespace :admin do
		resources :items, only: [:index, :new, :create, :show, :edit, :update]
		resources :customers, only: [:index, :show, :edit, :update]
		resources :genres, only: [:index, :creaet, :edit, :update]
		resources :orders, only: [:index, :show, :update]
		resources :order_ditails, only: [:update]
		# admin のtopページ
		# 注文件数が書かれているページ
		get 'oeder/top', to:'orders#top'
	end

	namespace :public do
		get 'item/top', to:'items#top'
		get 'order/thanks', to:'orders#thanks'
		get 'order/confirm', to:'orders#confirm'
		get 'customer/confirm', to:'customers#confirm'
		put "/customers/:id/hide" => "customers#hide", as: 'customers_hide'
		delete "cart_item/:id/destroy_all", to: "cart_items#destroy_all"
		resources :customers
		resources :items, only:[:index, :show]
		resources :addresses,only:[:index, :edit, :create, :update, :destroy]
		resources :cart_items, only:[:index, :update, :destroy, :create, :delete] do
					collection do
				delete 'destroy_all'
			end
		end
		resources :orders, only:[:new, :create, :index, :show] do
			collection do
				post :confirm
			end
		end
	end
end
