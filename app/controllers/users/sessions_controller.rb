class Users::SessionsController < Devise::SessionsController
    def create
      	resource = User.find_by_email(params[:email])
      	if resource != nil
      		if resource.valid_password?(params[:password])
        		sign_in :user, resource

        		render status: :ok, json: resource.author
      		else
            render status: :forbidden, nothing: true
          end
        else
      		render status: :forbidden, nothing: true
      end
    end
end
