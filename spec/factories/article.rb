require 'faker'

FactoryGirl.define do
  factory :article do |f|
    f.name {Faker::Name.name }
    f.body {Faker::Lorem.paragraph(2)}
    f.category {"EMT"}
  end
end