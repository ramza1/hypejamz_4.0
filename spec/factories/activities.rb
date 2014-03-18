# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :activity do
    user nil
    public false
    item_id 1
    item_type "MyString"
  end
end
