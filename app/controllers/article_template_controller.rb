class ArticleTemplateController < ApplicationController
	def index
		@templates = ArticleTemplate.all
		
		render json: @templates
	end
	
	def create
		#article_params = JSON.parse(params[:article_template])

		template = ArticleTemplate.create(article_template_params)

		if template.valid?
			render :nothing => true, :status => :created
		else
			render :nothing => true, :status => :error
		end
	end
	
	def destroy
		template = ArticleTemplate.find(params[:id])
		template.delete
		
		render :nothing => true, :status => :ok
	end
		
	private
	def article_template_params
		params.require(:article_template).permit(:name, :html)
	end
end
