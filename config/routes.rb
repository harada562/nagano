Rails.application.routes.draw do

	root 'public/items#top'
  	get 'home/about', to:'homes#about'

  	devise_for :admins
  	devise_for :customers

  	namespace :admin do
		resources :items
		resources :customers
		resources :genres
		resources :cart_items
		resources :orders
		resources :order_ditails
		resources :addresses
		# admin のtopページ
		# 注文件数が書かれているページ
		get 'oeder/top', to:'orders#top'
	end

	namespace :public do
		get 'item/top', to:'items#top'
		resources :customers
		resources :items, only: [:index, :show]
		resources :genres, only: [:index]
		resources :cart_items
		resources :orders, only: [:index]
		resources :order_ditails, only: [:index]
		resources :addresses, only: [:index]
	end
end
