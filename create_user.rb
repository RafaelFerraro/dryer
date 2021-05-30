require 'dry/transaction'
require 'dry/container'
require 'dry/transaction/operation'
require_relative 'container'
require_relative 'users/validate'
require_relative 'users/create'

class CreateUser
  include Dry::Transaction(container: Container)

  step :validate, with: "validate"
  step :create, with: "create"

  def create(input)
    p "Preparing to create a user with these input values = #{input}"

    super(input)
  end
end

# success call
CreateUser.new.call(id: '1', name: 'Rafael') do |result|
  result.success do |user|
    puts "User id: #{user.id} and name: #{user.name}"
  end

  result.failure do |error|
    puts "Could not create a user! Error: #{error.inspect}"
  end
end

# fail call
CreateUser.new.call(id: nil, name: 'Rafael') do |result|
  result.success do |user|
    puts "User id: #{user.id} and name: #{user.name}"
  end

  result.failure do |error|
    puts "Could not create a user! Error: #{error}"
  end
end
