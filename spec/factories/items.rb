FactoryBot.define do
  factory :item do
    item_name              { "test" }
    explanation            { "aaaaa" }
    category_id            {  2  }
    condition_id           {  2  }
    charge_id              {  2  }
    area_id                {  2  }
    day_id                 {  2  }
    price                  { 555 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item_sample.png')
    end
  end
end
