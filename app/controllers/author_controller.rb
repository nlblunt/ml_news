class AuthorController < ApplicationController
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
