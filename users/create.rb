require 'ostruct'

module Users
  class Create
    include Dry::Transaction::Operation

    def call(input)
      Success(
        OpenStruct.new(
          id: input[:id],
          name: input[:name]
        )
      )
    end
  end
end
