Rails.application.routes.draw do
  namespace :admin do
    resources :items, only:[:index, :new, :create, :show, :edit, :update]
    resources :customers, only:[:index, :new, :create, :show, :edit, :update]
    resources :orders, only:[:index, :new, :create, :show, :edit, :update]
  end

scope module: :public do
  root 'items#top'
get 'top' => 'public/items#top'
get 'about' => 'items#about'
resources :items

resources :customers do
    member do
       get 'confirm_withdraw'
       patch 'withdraw'
     end
   end
   
end

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

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
