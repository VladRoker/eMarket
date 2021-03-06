Rails.application.routes.draw do
  	root 'categories#index'
  	get "/contacts" => 'users#contacts', as: 'contacts'

  	resources :categories,  only:   [:index, :show]
  	resources :products,    only:   [:show]
  	resources :orders,      only:   [:new, :create]
  	resources :coupons,     except: [:edit, :update]

	# this action adds product to cart
  	post 'product/add' => 'products#add', as: 'add_product'

  	# these routes are for showing users a login form, logging them in, and logging them out.
  	get '/login' => 'sessions#new', as: 'login'
  	post '/login' => 'sessions#create', as: 'sign_in'
  	get '/logout' => 'sessions#destroy', as: 'destroy_user_session'

  	# these routes are for user registration and sign up form
  	get '/registration' => 'users#new', as: 'registration'
  	post '/users' => 'users#create', as: 'sign_up'

  	get "/#{ADMIN_ROUTE}" => 'admins#index'
  	patch "/#{ADMIN_ROUTE}" => 'admins#update'
  	post "/#{ADMIN_ROUTE}" => 'admins#create'
  	delete "/#{ADMIN_ROUTE}/:type/:id" => 'admins#delete', as: 'admin_delete'
  	get "/#{ADMIN_ROUTE}/contacts" => 'admins#contacts', as: 'admin_contacts'
  	get "/#{ADMIN_ROUTE}/contacts/new" => 'admins#new_contact', as: 'admin_new_contacts'
  	get "/#{ADMIN_ROUTE}/users" => 'admins#users', as: 'admin_users'
  	get "/#{ADMIN_ROUTE}/user/:id" => 'admins#user', as: 'admin_user_page'
  	get "/#{ADMIN_ROUTE}/categories" => 'admins#categories_index', as: 'admin_categories'
  	get "/#{ADMIN_ROUTE}/category/new" => 'admins#new_category', as: 'admin_new_category'
  	get "/#{ADMIN_ROUTE}/coupons" => 'admins#coupons', as: 'admin_coupons'
  	get "/#{ADMIN_ROUTE}/coupon/:id" => 'admins#coupon', as: 'admin_coupon_page'
  	get "/#{ADMIN_ROUTE}/coupon/new" => 'admins#new_coupon', as: 'admin_new_coupon'
  	get "/#{ADMIN_ROUTE}/category/:id" => 'admins#category', as: 'admin_category_page'
  	get "/#{ADMIN_ROUTE}/products" => 'admins#products', as: 'admin_products'
  	get "/#{ADMIN_ROUTE}/product/new" => 'admins#new_product', as: 'admin_new_product'
  	get "/#{ADMIN_ROUTE}/product/:id" => 'admins#product', as: 'admin_product_page'
  	get "/#{ADMIN_ROUTE}/orders" => 'admins#orders', as: 'admin_orders'
  	get "/#{ADMIN_ROUTE}/order/:id" => 'admins#order', as: 'admin_order_page'
end
