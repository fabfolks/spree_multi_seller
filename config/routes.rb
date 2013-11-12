Spree::Core::Engine.routes.draw do
    namespace :admin do
        resources :seller_orders do
        end
        resources :sellers do
        	resources :store_addresses do
        	end
        	resources :bank_details do
        	end
        	resources :seller_categories do
        	end
          resources :users do
          end
        end
    end

     resources :sellers, only: [:new, :create]
end
