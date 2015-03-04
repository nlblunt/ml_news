class Author < ActiveRecord::Base
	has_many :articles
	has_many :article_templates, :through => :articles
end
