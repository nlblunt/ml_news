require 'rails_helper'

RSpec.describe ArticleTemplateController, type: :controller do
	before(:each) do
		ArticleTemplate.destroy_all
	end
	
	describe "GET 'index'" do
		it "Returns a list of templates" do
			ArticleTemplate.create(name: "Test", html: "HTML")
			ArticleTemplate.create(name: "Test2", html: "HTML")
			expect(ArticleTemplate.count).to eq(2)
			
			get :index
			expect(assigns(:templates).count).to eq(2)
		end
	end
	
	describe "POST 'create'" do
		describe "With valid params" do
			it "Creates a new Article Template" do
				post :create, article_template:{name: "Test", html: "<html>"}#.to_json

				expect(ArticleTemplate.count).to eq(1)
				expect(response.status).to eq(201)
			end
		end

		describe "With invalid params" do
			it "Does not create a new Article Template" do
				post :create, article_template:{name: nil}#.to_json

				expect(ArticleTemplate.count).to eq(0)
				expect(response.status).to eq(500)
			end
		end
	end
	
		describe "POST 'delete'" do
		it "Deletes the Template" do
			template = ArticleTemplate.create(name: "Name", html: "HTML")
			expect(ArticleTemplate.count).to eq(1)
			
			delete :destroy, {id: template.id}
			
			expect(ArticleTemplate.count).to eq(0)
		end
	end
end
