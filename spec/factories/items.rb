FactoryBot.define do
  factory :item, class: Item do
    name                    {"シャツ"}
    price                   {"1000"}
    description             {"これはシャツです"}
    status                  {"未使用に近い"}
    prefecture              {"北海道"}
    fee                     {"1"}
    arrival                 {"1~2日で発送"}

    after(:create) do |item|
      create(:image, item_id: item.id)
      
    end
  end
end


