FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { '1' }
    city { '札幌' }
    addresses { '1-1' }
    building_name { 'むつみ荘' }
    phone_number { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
