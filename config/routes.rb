Rails.application.routes.draw do
  root 'articles#guest_index'
  devise_for :users, controllers: {registrations: 'registrations'}

  resources :articles
  post 'publish_article', to: 'articles#publish'
  post 'unpublish_article', to: 'articles#unpublish'
end
