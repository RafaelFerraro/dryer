module Users
  class Validate
    include Dry::Transaction::Operation

    def call(input)
      return Failure("Validation error: missing id value") if input[:id].nil?

      Success(input)
    end
  end
end
