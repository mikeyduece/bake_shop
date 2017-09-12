FactoryGirl.define do
  factory :ingredient do
    sequence :name do |n|
      "#{n}Flour"
    end
  end
  
  factory :user do
    username 'Mike Kalanty'
    password 'password'
  end
  
  factory :recipe do 
    sequence :name do |n|
      "#{n}recipe"
    end
  end
  
  factory :recipe_ingredient do
    sequence :amount do |n|
      n + 0.5
    end
    recipe
    ingredient
  end
end