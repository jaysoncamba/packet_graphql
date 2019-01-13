Types::ObjectType = GraphQL::ScalarType.define do
  name 'object'
  description 'scalar type object that returns as is'

  coerce_result ->(value, _) {
    value
  }
end
