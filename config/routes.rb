Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :campaigns
  end

  get '/campaign/:id', to: 'campaigns#show'
end
