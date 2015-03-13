require 'rails_helper.rb'

RSpec.describe Article, type: :model do
  it "is invalid without a name" do
  	expect(FactoryGirl.build(:article, title: nil)).not_to be_valid
  end

  it "is invalid without an author" do
  	expect(FactoryGirl.build(:article, author: nil)).not_to be_valid
  end
  
  it "is invalid without a HTML template" do
  	expect(FactoryGirl.build(:article, article_template_id: nil)).not_to be_valid
  end
  
  it "is invalid without a category" do
  	expect(FactoryGirl.build(:article, category: nil)).not_to be_valid
  end
end
