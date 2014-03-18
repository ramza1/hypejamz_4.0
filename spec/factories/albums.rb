# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :album do
    name "MyString"
    released_at "2012-03-31 03:25:04"
    about "MyText"
  end
end
