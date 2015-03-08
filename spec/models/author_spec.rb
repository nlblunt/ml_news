require 'rails_helper'

RSpec.describe Author, type: :model do
	it "is invalid without a name" do
		expect(FactoryGirl.build(:author, name: nil)).not_to be_valid
	end
	
	it "creates a devise sign in" do
		author = FactoryGirl.build(:author)
		
		expect(User.count).to eq(0)
		
		author.createSignin(password: "pass")
		expect(User.count).to eq(1)
	end
end
