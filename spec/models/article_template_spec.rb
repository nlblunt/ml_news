require 'rails_helper'

RSpec.describe ArticleTemplate, type: :model do
	it "is invalid without a name" do
		expect(ArticleTemplate.create(name: nil, html: "test")).not_to be_valid
	end

	it "is invalid without an html file" do
		expect(ArticleTemplate.create(name: "test", html: nil)).not_to be_valid
	end
end
