class AuthorController < ApplicationController
	def index
		@authors = Author.all

		#render json: @authors
		render :index
	end

	def create
		#author_params = JSON.parse(params[:author])
		user = User.create(user_params)
		author = user.create_author(author_params)
		
		if author.valid?
			render :nothing => true, :status => :created
		else
			render :nothing => true, :status => :error
		end
	end
	
	def destroy
		author = Author.find(params[:id])
		author.delete

  		render :nothing => true, :status => :ok
	end
	
	private
	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end
	
	def author_params
		params.require(:author).permit(:name)
	end
end
