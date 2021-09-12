class ActivePresenter
  attr_reader :id, :name, :created_at

  def initialize(attrs)
    @id                 = attrs[:id]
    @code               = attrs[:code]
    @description        = attrs[:description]
    @source             = attrs[:source]
    @segment            = attrs[:segment] 
    @company_name       = attrs[:company_name]
    @national_registry  = attrs[ :national_registry]
    @active_type        = attrs[:active_type]
    @created_at         = attrs[:created_at]
  end
end
