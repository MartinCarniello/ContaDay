Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :companies do
  	member do
  		post   :access
  		delete :quit
  		get    :general_expenses
  	end
  end

  resources :general_expenses

  root to: 'companies#index'
end
