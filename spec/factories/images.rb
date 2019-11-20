FactoryBot.define do
  factory :image do
    image_url     {File.open("#{Rails.root}/public/test_uploaders/IMG_4370.JPG")}
    item_id  {1}
  end
end
