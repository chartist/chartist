FactoryGirl.define do
  factory :user do
    email "test@test.com"
    password "test1234"
    password_confirmation "test1234"
  end
  factory :hacker, class: User do
    email "hacker@test.com"
    password "test1234"
    password_confirmation "test1234"
  end
end
