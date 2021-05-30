require "dry/transformer"

class Mapper < Dry::Transformer::Pipe
  import Dry::Transformer::ArrayTransformations
  import Dry::Transformer::HashTransformations

  define! do
    map_array do
      symbolize_keys
      rename_keys user_name: :name
      nest :address, [:city, :street, :zipcode]
    end
  end
end

mapper = Mapper.new

input = [
  {
    'user_name' => 'Rafael',
    'city' => 'Lauro de Freitas',
    'street' => 'Itagi',
    'zipcode' => '42701370'
  }
]

p "Input: #{input}"
output = mapper.(input)
p "Output: #{output}"
