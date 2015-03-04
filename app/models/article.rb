class Article < ActiveRecord::Base
  has_one :article_template
  belongs_to :author
end
