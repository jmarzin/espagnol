Rails.application.routes.draw do

  resources :traductions, only: :index

  resources :problemes

  resources :categories

  get 'questions/vocabulaire', as: 'questions_vocabulaire'
  get 'questions/conjugaison', as: 'questions_conjugaison'
  get 'questions/revision_conjugaison', as: 'questions_revision_conjugaison'
  get 'questions/revision_vocabulaire', as: 'questions_revision_vocabulaire'
  post 'questions/verification'
  get 'questions', to: 'questions#revision', as: 'questions_revision'
  get 'sauve', to: 'sauve#lance', as: 'lance_sauve'
  post 'ecrit', to: 'sauve#ecrit', as: 'sauve_mot_verbe'
  get 'stats', to: 'stats#affiche', as: 'affiche_stats'

  get 'aide', to: 'aide#show', as:'aide'

  resources :parametres, only: [:edit, :update]

  resources :mots

  resources :verbes

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :date_categories, :categories,
                :date_mots, :mots,
                :date_verbes, :verbes,
                :date_formes, :formes, only: [:index]
    end
    namespace :v2 do
      resources :date_categories, :categories,
                :date_mots, :mots,
                :date_verbes, :verbes,
                :date_formes, :formes, only: [:index]
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'mots#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
