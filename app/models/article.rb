class Article < ActiveRecord::Base
  belongs_to :article_template
  belongs_to :author
end
