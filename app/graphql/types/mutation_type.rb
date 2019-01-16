# frozen_string_literal: true

Types::MutationType = GraphQL::ObjectType.define do
  name 'Mutation'

  field :deleteDevice, Mutations::Device::DeleteDevice.field
  field :createDevice, Mutations::Device::CreateDevice.field
end
