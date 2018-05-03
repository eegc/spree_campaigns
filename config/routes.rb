Spree::Core::Engine.routes.draw do
  namespace :admin do
    resources :campaigns
  end

  get '/campaigns/:id', to: 'campaigns#show', as: :campaign
end
