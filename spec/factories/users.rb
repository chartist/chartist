FactoryGirl.define do
  factory :user do
    username "foo"
    email "test@test.com"
    password "test1234"
    password_confirmation "test1234"
  end

  factory :mario, class: User do
    username "mariogintili"
    email "mario@mario.com"
    password "12345678"
    password_confirmation "12345678"
  end
  factory :hacker, class: User do
    username "bar"
    email "hacker@test.com"
    password "test1234"
    password_confirmation "test1234"
  end
end
