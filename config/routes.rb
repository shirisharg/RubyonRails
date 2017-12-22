Rails.application.routes.draw do
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	resource :skill
	resource :project
	resource :employee do
		get 'team_details'
	end
    root 'employees#index'
end
