FactoryGirl.define do

  factory :user do
    sequence(:username, Random.rand(1..20)) { |n| "jdoe#{n}" }
    first_name "John"
    last_name  "Doe"
    sequence(:email, Random.rand(1..100)) { |n| "person#{n}@example.com" }
    sequence(:identity, Random.rand(1000..1100)) { |n| "#{n}"}
    password "password"
    password_confirmation "password"
    birth_date "11-09-1988"
  end

  factory :lease_holder, class: LeaseHolder do
    sequence(:username, Random.rand(1..20)) { |n| "jdoe#{n}" }
    first_name "John"
    last_name  "Doe"
    sequence(:email, Random.rand(1..100)) { |n| "person#{n}@example.com" }
    sequence(:identity, Random.rand(1000..1100)) { |n| "#{n}"}
    password "password"
    password_confirmation "password"
    birth_date "11-09-1988"
  end

end
