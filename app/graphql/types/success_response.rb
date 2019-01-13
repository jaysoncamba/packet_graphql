module Types
  SuccessResponse = GraphQL::ObjectType.define do
    name 'SuccessResponse'
    description 'A successful response'
    field :success, !types.Boolean, hash_key: :success
  end
end
