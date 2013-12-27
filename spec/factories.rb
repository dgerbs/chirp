FactoryGirl.define do
  factory :user do
    name  "Doug Gerber"
    email "doug@example.com"
    password "foobar123"
    password_confirmation "foobar123"
  end
end