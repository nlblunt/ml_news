require 'rails_helper'

RSpec.describe AuthorController, type: :controller do
	describe "POST 'create'" do
		describe "With valid params" do
			it "Creates a new Author" do
				post :create, author:{name: "Name"}.to_json

				expect(Author.count).to eq(1)
				expect(response.status).to eq(201)
			end
		end

		describe "With invalid params" do
			it "Does not create a new Author" do
				post :create, author:{name: nil}.to_json

				expect(Author.count).to eq(0)
				expect(response.status).to eq(500)
			end
		end
	end
end