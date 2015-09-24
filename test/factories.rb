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

end