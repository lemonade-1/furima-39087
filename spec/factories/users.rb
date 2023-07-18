FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { 'てすと' }
    first_name { '太郎' }
    last_name_kana { 'テスト' }
    first_name_kana { 'タロウ' }
    birthday { Faker::Date.birthday }
  end
end
