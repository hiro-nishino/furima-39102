FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation {password}
    last_name             {'すずき'}
    first_name            {'いちろう'}
    last_name_kana        {'スズキ'}
    first_name_kana       {'イチロー'}
    birth_date            {'1973-10-22'}
  end
end