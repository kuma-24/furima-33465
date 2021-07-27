FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    birth_date            { Faker::Date.between(from: '2020-09-23', to: '2020-09-25') }
    password              { Faker::Internet.password(min_length: 6, max_length: 100) }
    password_confirmation { password }
    first_name            { person.first.kanji }
    last_name             { person.last.kanji }
    first_name_kana       { person.first.katakana }
    last_name_kana        { person.last.katakana }
  end
end
