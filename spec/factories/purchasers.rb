FactoryBot.define do
  factory :purchaser do
    token         {'params[:token]'}
    user_id       {'1'}
    item_id       {'1'}
    buyer_id      {'1'}
    postal_code   {'333-0803'}
    prefecture_id {'2'}
    city          {'埼玉'}
    house_number  {'56-1'}
    building_name {'六本木ヒルズ'}
    phone_number  {'08070639085'}
  end
end
