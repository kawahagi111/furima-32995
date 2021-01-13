FactoryBot.define do
  factory :order_address do
    user_id { 3 }
    item_id { 3 }
    token { 'token' }
    postal_code             { '645-0333' }
    area_id                 { 3 }
    city                    { '田辺' }
    house_number            { '1111' }
    building_name           { 'aaa' }
    phone                   { '09012345678' }
  end
end
