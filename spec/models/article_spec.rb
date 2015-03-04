require 'rails_helper.rb'

RSpec.describe Article, type: :model do
  it "is invalid without a name" do
  	FactoryGirl.create(:article, name: nil)
  	expect(Article.count).to eq(0)
  end

  it "is invalid without an author" do
  	FactoryGirl.create(:article, author: nil)
  	expect(Article.count).to eq(0)
  end
  
  it "is invalide without a HTML template" do
    FactoryGirl.create(:article, article_template_id: nil)
    expect(Article.count).to eq(0)
  end
  
  it "is invalid without a category" do
    FactoryGirl.create(:article, category: nil)
    expect(Article.count).to eq(0)
  end
  
  it "sets MAJOR to false as default" do
    article = FactoryGirl.create(:article)
    expect(article.major).to eq("false")
  end
end
