FactoryBot.define do
  factory :item do
    item_name              { 'test' }
    explanation            { 'aaaaa' }
    category_id            { '2' }
    condition_id           { '2' }
    charge_id              { '2' }
    area_id                { '2' }
    day_id                 { '2' }
    price                  { '555' }
    association :user
  end
end
