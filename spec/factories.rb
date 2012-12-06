FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "#{n}example@example.com" }
    sequence(:username) { |n| "foobar#{n}" }
    name 'foo bar'
    password 'please'
    password_confirmation 'please'
    admin false
    factory :quire_admin do
      admin true
    end
  end
end