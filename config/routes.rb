Rails.application.routes.draw do

	root 'public/items#top'
  	get 'home/about', to:'homes#about'

  	devise_for :admins
  	devise_for :customers

  	namespace :admin do
		resources :items, only: [:index, :new, :create, :show, :edit, :update]
		resources :customers do
			member do
    			patch 'user_restore'
   			end
   		end
		resources :genres, only: [:index, :create, :edit, :update]
		resources :orders, only: [:index, :show, :update]
		resources :order_details, only: [:update]
		# admin のtopページ
		# 注文件数が書かれているページ
		get 'order/top', to:'orders#top'
	end

	namespace :public do
		get 'item/top', to:'items#top'
		get 'order/thanks', to:'orders#thanks'
		get 'customer/confirm', to:'customers#confirm'
		# put "/customers/:id/is_delete" => "customers#id_delete", as: 'customers_is_delete'
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
				post :new, path: :new, as: :new, action: :back
				post :confirm
				get :complete
			end
		end
	end
end
