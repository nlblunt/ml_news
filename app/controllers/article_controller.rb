class ArticleController < ApplicationController
    def create
        article = Article.create(article_params)
        
        if article.valid?
            render :nothing => true, :status => :created
        else
            render :nothing => true, :status => :error
        end
    end
    
    private
    def article_params
        params.require(:article).permit(:name, :body, :category, :major, :display_img, :news_img, :author_id, :article_template_id)
    end
end
