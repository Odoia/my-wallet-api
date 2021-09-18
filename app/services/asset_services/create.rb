module AssetServices
  class Create
    def initialize(params:)
      @code               = params[:code]
      @description        = params[:description]
      @source             = params[:source]
      @segment            = params[:segment]
      @company_name       = params[:company_name]
      @national_registry  = params[:national_registry]
      @asset_type         = params[:asset_type].to_i
    end

    def call
      create_asset
    end

    private

    attr_reader :code, :description, :source, :segment, :company_name, :national_registry, :asset_type

    def create_asset
      ::Asset.new.tap do |a|
        a.code = code
        a.description = description
        a.source = source
        a.segment = segment
        a.company_name = company_name
        a.national_registry = national_registry
        a.asset_type = asset_type
        a.save
      end
    end
  end
end
