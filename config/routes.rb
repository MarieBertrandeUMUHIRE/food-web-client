Rails.application.routes.draw do
 get "/foods", to: 'foods#index'
 get "/foods", to: 'foods#new'
 get "/foods/:id", to: 'foods#show'
 post "/foods", to: 'foods#create'
 patch "/foods/:id", to: 'foods#update'
 get "/foods/:id/edit", to: 'foods#edit'
 delete "/foods/:id", to: 'foods#destroy'

end
