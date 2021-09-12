module ActiveServices
  class Create
    def initialize(params:)
      @code               = params[:code]
      @description        = params[:description]
      @source             = params[:source]
      @segment            = params[:segment]
      @company_name       = params[:company_name]
      @national_registry  = params[:national_registry]
      @activetype         = params[:active_type]
    end

    def call
      active_create
    end

    private

    attr_reader :code, :description, :source, :segment, :company_name, :national_registry, :active_type

    def active_create
      ::Active.new.tap do |a|
        a.code = code
        a.description = description
        a.source = source
        a.segment = segment
        a.company_name = company_name
        a.national_registry = national_registry
        a.active_type = active_type
        a.save
      end
    end
  end
end
