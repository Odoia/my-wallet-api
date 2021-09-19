class WalletPresenter
  attr_reader :id, :name, :description, :status, :user, :created_at

  def initialize(attrs)
    @id           = attrs[:id]
    @name         = attrs[:name]
    @description  = attrs[:description]
    @status       = attrs[:status]
    @user         = attrs[:user_id]
    @created_at   = attrs[:created_at]
    @distribution = attrs[:distribution]
  end
end
