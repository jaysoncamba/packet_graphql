# frozen_string_literal: true

Types::ObjectType = GraphQL::ScalarType.define do
  name 'object'
  description 'scalar type object that returns as is'

  coerce_result lambda { |value, _|
    value
  }
end
