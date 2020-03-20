Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '', to:'pages#home'
  get 'home', to:'pages#home'
  get 'about', to:'pages#about'

  resources :articles

end
