# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :datapoint do
    x "MyString"
    y "MyString"
    chart nil
  end
end
