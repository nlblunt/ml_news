class ArticleController < ApplicationController
    def create
        article = Article.create(article_params)
        
        if article.valid?
            render :nothing => true, :status => :created
        else
            render :nothing => true, :status => :error
        end
    end
    
    def getMajorArticles
       @articles = Article.where(major: "t").last(6)
       
       render :getMajorArticles
    end
    
    private
    def article_params
        params.require(:article).permit(:title, :body, :category_id, :major, :display_img, :caption, :author_id)
    end
end