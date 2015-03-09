class Author < ActiveRecord::Base
	belongs_to :user
	has_many :articles
	has_many :article_templates, :through => :articles

	validates :name, presence: true
end
