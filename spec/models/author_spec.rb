require 'rails_helper'

RSpec.describe Author, type: :model do
	it "is invalid without a name" do
		expect(FactoryGirl.build(:author, name: nil)).not_to be_valid
	end
end
