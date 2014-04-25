# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :chart do
    name "MyString"
    chart_type 1
    x_type 1
  end
end
