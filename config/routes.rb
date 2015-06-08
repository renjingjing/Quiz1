Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  root "quizzes#index"

  get "/quizzes/new" => "quizzes#new", as: :new_quiz

  # this will match a POST request with url "/quizzes"
  # to the quizzes controller with create action
  post "/quizzes" => "quizzes#create", as: :new_quizzes

  # this will match any GET request with "/quizzes/something"
  # the "something" could be anything. In this case we expect it
  # to be an id of the quiz. We will get this id in our our controller
  # as part of the params object.
  # the as: :quiz option enables us to have a helper method like:
  # quiz_path or quiz_url
  get "/quizzes/:id" => "quizzes#show", as: :quiz

  get "/quizzes" => "quizzes#index"

  get "/quizzes/:id/edit" => "quizzes#edit", as: :edit_quiz

  patch "/quizzes/:id" => "quizzes#update"

  delete "/quizzes/:id" => "quizzes#destroy"

  get "/find" => "find#index"

  post "/find" => "find#create"
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
