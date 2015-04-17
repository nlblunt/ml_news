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
       @articles = Article.where(major: "t").order(created_at: :desc)
       
       render :getMajorArticles
    end
    
    def getAuthorArticles
        @articles = Article.where(author_id: params[:id]).order(created_at: :desc)
        
        render json: @articles
    end
    
    def update
        article = Article.find(params[:id])
        article.update_attributes(article_params)
        
        render nothing: true
    end
    
    def show
       article = Article.find(params[:id])
       
       render json: article
    end
    
    private
    def article_params
        params.require(:article).permit(:title, :body, :category_id, :major, :display_img, :caption, :author_id)
    end
end