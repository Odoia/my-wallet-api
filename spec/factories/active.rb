FactoryBot.define do
  factory :active, class: '::Active' do
    code { 'code' }
    description { 'description' }
    source { 'source' }
    segment { 'segment' }
    company_name { 'company_name' }
    national_registry { 'national_registry' }
    active_type { 1 }
  end
end
