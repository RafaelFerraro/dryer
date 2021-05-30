class Container
  extend Dry::Container::Mixin

  register "validate" do
    Users::Validate.new
  end

  register "create" do
    Users::Create.new
  end
end
