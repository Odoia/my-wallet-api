FactoryBot.define do
  factory :user, class: '::User' do
    name { Faker::Name.name }
  end
end
