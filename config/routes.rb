Rails.application.routes.draw do
  resources :projects
   devise_for :users, controllers: {
        sessions: 'users/sessions', registrations: 'users/registrations'
      }

  get 'home/index'
root 'home#index'

get '/contact' => 'home#contact'
post 'home/create_contact'
# without model g and controller g are use this file 
get '/about_us' => 'home#about_us'
post 'home/create_about_us'


resources :articles


resources :courses



resources :students


end
