Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  mount Commontator::Engine => '/commontator'


  root to: 'pages#index'



  devise_scope :user do
  get 'login', to: 'devise/sessions#new'
  get 'signup', to: 'devise/registrations#new'
	end

	resources :posts do
  		collection do
    		get 'life'
    		get 'physical'
    		get 'applied'
  end
end



end



