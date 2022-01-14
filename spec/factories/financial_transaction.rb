FactoryBot.define do
  factory :financial_transaction, class: '::FinancialTransaction' do
    asset { FactoryBot.create(:asset) }
    wallet { FactoryBot.create(:active_wallet) }
    financial_type { 1 }
    quantity { 50 }
    unit_value { 10.00 }
    tax { 0.01 }
    transaction_date { Date.today }
  end
end
