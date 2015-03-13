require 'rails_helper'

RSpec.describe ArticleController, type: :controller do
	before(:each) do
		Article.destroy_all
	end
	
	describe "POST 'create'" do
		describe "With valid params" do
			it "Creates a new article" do
				author = Author.create(name: "Author")
				template = ArticleTemplate.create(name: "test", html: "HTML")
				
				post :create, article:{title: "Name", body: "Body Text Text", category: "Faction", author_id: author.id, article_template_id: template.id}
				
				expect(Article.count).to eq(1)
				expect(response.status).to eq(201)
			end
		end
		
		describe "With invalid params" do
			it "Doesn't create a new article" do
				author = Author.create(name: "Author")
				template = ArticleTemplate.create(name: "test", html: "HTML")
				
				post :create, article:{title: nil, body: "Body Text Text", faction: "Faction", major: true, author_id: 1, article_template_id: 1}
			
				expect(Article.count).to eq(0)
				expect(response.status).to eq(500)
			end
		end
	end
end