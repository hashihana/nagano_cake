Rails.application.routes.draw do
  
   # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  
  namespace :admin do
    get "items/top" => "items#top"
    resources :items
    resources :customers, only:[:index, :new, :create, :show, :edit, :update]
    resources :orders, only:[:index, :new, :create, :show, :edit, :update]
  end

scope module: :public do
  root 'items#top'
get 'top' => 'public/items#top'
get 'about' => 'items#about'
get 'orders/thanks' => "orders#thanks"
post 'orders/confirm'
resources :items

resources :customers do
    member do
       get 'confirm_withdraw'
       patch 'withdraw'
     end
   end
   delete '/cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all_cart_items'
   resources :addresses
   resources :cart_items
   resources :orders,only: [:index, :new, :create, :show]
end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
