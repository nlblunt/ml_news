require 'rails_helper'

RSpec.describe AuthorController, type: :controller do
	before(:each) do
		Author.destroy_all
	end
	
	describe "POST 'create'" do
		describe "With valid params" do
			it "Creates a new Author" do
				post :create, author:{name: "Name"}#.to_json

				expect(Author.count).to eq(1)
				expect(response.status).to eq(201)
			end
		end

		describe "With invalid params" do
			it "Does not create a new Author" do
				post :create, author:{name: nil}#.to_json

				expect(Author.count).to eq(0)
				expect(response.status).to eq(500)
			end
		end
	end

	describe "GET 'index'" do
		it "Returns a list of Authors" do
			FactoryGirl.create(:author)
			FactoryGirl.create(:author)

			post :index

			expect(assigns(:authors).count).to eq(2)
		end
	end
	
	describe "POST 'delete'" do
		it "Deletes the Artist" do
			author = FactoryGirl.create(:author)
			expect(Author.count).to eq(1)
			
			delete :destroy, author:{id: author.id}
			
			expect(Author.count).to eq(0)
		end
	end
end