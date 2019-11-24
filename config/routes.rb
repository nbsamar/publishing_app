Rails.application.routes.draw do
  root 'articles#guest_index'
  devise_for :users, controllers: {registrations: 'registrations'}

  resources :articles
end
