require 'faker'

FactoryGirl.define do
  factory :article do |f|
    f.title {Faker::Name.name }
    f.body {Faker::Lorem.paragraph(2)}
    f.category_id 1
  end
end