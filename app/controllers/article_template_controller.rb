class ArticleTemplateController < ApplicationController
	def create
		article_params = JSON.parse(params[:article_template])

		template = ArticleTemplate.create(article_params)

		if template.valid?
			render :nothing => true, :status => :created
		else
			render :nothing => true, :status => :error
		end
	end
end
