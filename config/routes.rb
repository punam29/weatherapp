Rails.application.routes.draw do
  

  get 'home/index'
  #get '/display', to: 'home#index'
  root 'home#index'
end
