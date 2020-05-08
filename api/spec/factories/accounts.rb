FactoryBot.define do
  factory :account, class: 'Account' do
    sequence(:uid) { |n| "example_#{n}@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    sequence(:username) { |n| "example_#{n}" }
    sequence(:email) { |n| "example_#{n}@example.com" }
  end
end
