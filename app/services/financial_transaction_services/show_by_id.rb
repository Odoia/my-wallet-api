module FinancialTransactionServices
  class ShowById
    def initialize(id:)
      @id = id
    end

    def call
      financial_transaction_show
    end

    private

    attr_reader :id

    def financial_transaction_show
      result = FinancialTransaction.find_by(id: id)

      return nil if result.nil?

      show_by_id_presenter(result)
    end

    def show_by_id_presenter(result)
      ::FinancialTransactionPresenters::ShowById.new(result)
    end
  end
end
