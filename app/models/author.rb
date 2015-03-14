class Author < ActiveRecord::Base
	belongs_to :user
	has_many :articles

	validates :name, presence: true
end
