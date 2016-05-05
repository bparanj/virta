Rails.application.routes.draw do
  resources :articles, :comments
  
  root 'articles#index'
end
