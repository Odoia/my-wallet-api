class AssetPresenter
  attr_reader :id, :code, :description, :source, :segment, :company_name, :national_registry, :asset_type, :created_at

  def initialize(attrs)
    @id                 = attrs[:id]
    @code               = attrs[:code]
    @description        = attrs[:description]
    @source             = attrs[:source]
    @segment            = attrs[:segment] 
    @company_name       = attrs[:company_name]
    @national_registry  = attrs[ :national_registry]
    @asset_type         = attrs[:asset_type]
    @created_at         = attrs[:created_at]
  end
end
