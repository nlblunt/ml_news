class AuthorController < ApplicationController
	def index
		@authors = Author.all

		render json: @authors
	end

	def create
		author_params = JSON.parse(params[:author])

		author = Author.create(author_params)

		if author.valid?
			render :nothing => true, :status => :created
		else
			render :nothing => true, :status => :error
		end
	end
end
