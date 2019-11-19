FactoryBot.define do
  factory :item do
    name                    {"シャツ"}
    price                   {"1000"}
    description             {"これはシャツです"}
    status                  {"未使用に近い"}
    prefecture              {"北海道"}
    fee                     {"1"}
    arrival                 {"1~2日で発送"}
    # category_id             {36}
    # shipping_id             {3}
    # size_id                 {8}
  end


end


