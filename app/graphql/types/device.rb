Types::Device = GraphQL::ObjectType.define do
  name 'Device'
  description 'Device packet object'
  
  field :plan, Types::Plan
  field :operatingSystem, Types::OperatingSystem, property: :operating_system
  field :facility, Types::Facility
  field :id, types.String
  field :hostname, types.String
  field :state, types.String
  field :tags, types[types.String]
  field :iqn, types.String
  field :createdAt, Types::DateTime, property: :created_at
  field :updatedAt, Types::DateTime, property: :updated_at
  field :project, Types::Project
  field :ipAddresses, types[Types::ObjectType], property: :ip_addresses
end
