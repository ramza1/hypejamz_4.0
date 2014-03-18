# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :note do
    body "MyText"
    user nil
    comments_count 1
  end
end
