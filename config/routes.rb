Rails.application.routes.draw do
  namespace :api, constraints: { format: :json } do
    namespace :v1 do
      get 'tracks' => 'tracks#index', as: :tracks
    end
  end
end
