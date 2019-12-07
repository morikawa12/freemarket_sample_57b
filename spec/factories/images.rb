FactoryBot.define do
  factory :image do
    image    {File.open("#{Rails.root}/public/test_uploaders/test_pic.jpg")}
    item_id  {1}
    
    item
  end
end
