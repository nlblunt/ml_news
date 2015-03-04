class ArticleTemplate < ActiveRecord::Base
	belongs_to_many :articles
end
