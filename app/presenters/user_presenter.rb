class UserPresenter
  attr_reader :id, :name, :created_at

  def initialize(attrs)
    @id         = attrs[:id]
    @name       = attrs[:name]
    @created_at = attrs[:created_at]
  end
end
