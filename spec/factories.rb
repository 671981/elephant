# This will guess the User class
FactoryGirl.define do
  factory :user do
    first_name "John"
    last_name  "Doe"
    email "john@doe.com"
    id "10"
    password "12345678"
    admin false
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    first_name "Admin"
    last_name  "User"
    admin      true
  end

  factory :product do
    name "Nice bike"
    description "Very nice bike"
    colour "Black"
  end

  factory :comment do
    user_id "10"
    body "Not good bike"    
    rating "1"
    product_id "1"
  end

  factory :order do
    user_id "1"
    product_id "1"
    total "100"
  end

end