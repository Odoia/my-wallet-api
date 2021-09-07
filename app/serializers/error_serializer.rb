module ErrorSerializer
  class << self

    def call(errors:, status:)
      if errors.nil?
        return bad_request if status == 400
        return not_found if status == 404
      end

      serialize(errors, status)
    end

    def bad_request
      { status: 400, error: I18n.t('bad_request') }
    end

    def not_found
      { status: 404, error: I18n.t('not_found') }
    end

    def serialize(errors, status)
      json = {}
      new_hash = errors.to_hash.map do |k, v|
        v.map do |msg|
          { id: k, title: msg, status: status }
        end
      end.flatten
      json[:errors] = new_hash
      json
    end
  end
end
