FactoryGirl.define do

  factory :category do
    sequence(:name){|n| "Electronics_#{n}" }
    description "Some stuff running on AC/DC energy"
  end
  factory :subcategory do
    sequence(:name){|n| "Laptops_#{n}" }
    description "Portatable PC"
    parent FactoryGirl.create(:category)
  end

  factory :product do
    sequence(:name){|n| "Robot_#{n}" }
    description "A giant robot"
    price 10.00
    category
    factory :product_on_sale do
      sale_flag true
      discount 5.00
    end
    factory :available_product do
      quantity 5
    end
  end

  factory :user do
    sequence(:name){|n| "Sam_#{n}" }
    email { "#{name}@example.com" }
    factory :registred_user do
      password "secret"
    end
  end

  factory :order do
    user
    price 10.00
    status 'new'
    after(:create) do |order|
      3.times { order.products << FactoryGirl.create(:available_product) }
    end
  end
end