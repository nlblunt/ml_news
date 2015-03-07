require 'rails_helper'

RSpec.describe ArticleTemplateController, type: :controller do
	before(:each) do
		ArticleTemplate.destroy_all
	end
	
	describe "POST 'create'" do
		describe "With valid params" do
			it "Creates a new Article Template" do
				post :create, article_template:{name: "Test", html: "<html>"}.to_json

				expect(ArticleTemplate.count).to eq(1)
				expect(response.status).to eq(201)
			end
		end

		describe "With invalid params" do
			it "Does not create a new Article Template" do
				post :create, article_template:{name: nil}.to_json

				expect(ArticleTemplate.count).to eq(0)
				expect(response.status).to eq(500)
			end
		end
	end
end
