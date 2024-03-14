Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  get 'login',to:'sessions#new'
  get 'signup',to:'sessions#signup'
  post 'signup',to:'sessions#create_user'
  post 'login',to:'sessions#create'
  delete 'logout',to:'sessions#destroy'
  resources :books
  get '/books/filter/:category',to:'books#filter',as:"filter"
  get 'profile/:id',to:'pages#profile',as:'profile'
  get 'profile/:id/edit',to:'pages#edit',as:"profileEdit"
  patch 'profile/:id',to:'pages#update'
  get 'cart/:id',to:'pages#cart',as:'cart'
  post 'books/:id',to:'pages#add_cart'
  get 'about',to:'pages#about'
  delete 'item/:id',to:'carts#destroy',as:"item"
  delete 'profile/:id',to:'users#destroy'
  get 'search',to:'books#search'
  resources :payments
  post 'payments/:price/new' ,to:'payments#new' ,as:'pay'
  get 'payments/success' 
  get 'payments/cancel'
end
