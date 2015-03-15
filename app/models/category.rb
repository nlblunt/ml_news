class Category < ActiveRecord::Base
    has_many :articles
    
    validates :name, :short, presence: true
end
