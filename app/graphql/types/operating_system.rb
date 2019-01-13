Types::OperatingSystem = GraphQL::ObjectType.define do
  name 'OperatingSystem'
  description 'Operating system available for packet'
  
  field :id, types.String
  field :slug, types.String
  field :name, types.String
  field :distro, types.String
  field :version, types.String
  field :provisionableOn, types[types.String], property: :provisionable_on
end
