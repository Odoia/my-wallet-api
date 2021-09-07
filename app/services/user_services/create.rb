module UserServices
  class Create
    def initialize(name:)
      @name = name
    end

    def call
      user_create
    end

    private

    attr_reader :name

    def user_create
      ::User.new.tap do |u|
        u.name = name
        u.save
      end
    end
  end
end
