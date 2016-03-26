FactoryGirl.define do

  factory :category do
    sequence(:name){|n| "Electronics_#{n}" }
    description "Some stuff running on AC/DC energy"
  end
  factory :subcategory do
    sequence(:name){|n| "Laptops_#{n}" }
    description "Portable PC"
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
      factory :admin do
        admin_flag true
      end
    end
  end

  factory :comment do
    user
    product
    text "This is a nice product. I am really happy I bought it here. It would be more expensive on eBay, but just fine at your store."
  end

  factory :contact do
    sequence(:language){|n| "en_#{n}" }
    name {"#{language}Shop"}
    adress 'Delivery drive'
    phone "+000 15 555 555"
    email "shop@example.com"
    company_name "Jinteki"
    company_reg_nr '123456789'
    company_vat_nr 'GB123456789'
    bank 'First world bank'
    time_table 'Mon.-Fry. 8:00-18:30, Sat. 9:00-17:00, Sun. -'
    description 'We sell everything you could want to buy...'
  end

  factory :coupon do
    code 'CX-FBT-12ER-VL002-CRG'
    percent 50
    amount 220.99
    factory :registred_coupon do
      user
      factory :user_coupon do
        used_flag true
      end
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