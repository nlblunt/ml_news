require 'rails_helper'

RSpec.describe Article, type: :model do
  it "is invalid without a name" do
  	Article.create(name: nil)
  	expect(Article.count).to eq(0)
  end

  it "is invalid without an author" do
  	
end
