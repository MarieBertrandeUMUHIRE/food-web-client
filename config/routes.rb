Rails.application.routes.draw do
 get "/foods", to: 'foods#index'
 post "/foods", to: 'foods#index'
 post "/foods", to: 'foods#create'
 patch "/foods/:id", to: 'foods#update'
 get "/foods/:id", to: 'foods#new'
 post "/foods/:id", to: 'foods#create'
end
