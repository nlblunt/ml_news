require 'rails_helper'

RSpec.describe ArticleController, type: :controller do
	before(:each) do
		Article.destroy_all
	end
	
end
