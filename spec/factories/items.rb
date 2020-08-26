FactoryBot.define do
  factory :item do
                     
    name                    {"アンパンマン"}
    writings                {"元気100倍アンパンマン"}
    price                   {11111}
    category_id             {3}
    condition_id            {2}
    shipping_charges_id     {2}
    prefecture_id           {2}
    delivery_days_id        {2}
    user_id                 {1}
    association :user
    after(:build) {|item| item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test.png', content_type: 'image/png')}
  end
end

