Types::Facility = GraphQL::ObjectType.define do
  name 'Facility'
  description 'Facility packet object'
  
  field :id, types.String
  field :code, types.String
  field :name, types.String
  field :features, types[types.String]
end
