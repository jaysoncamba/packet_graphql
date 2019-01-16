# frozen_string_literal: true

Types::Plan = GraphQL::ObjectType.define do
  name 'Plan'
  description 'Operating system available for packet'

  field :id, types.String
  field :slug, types.String
  field :name, types.String
  field :description, types.String
  field :line, types.String
  field :specs, types[Types::ObjectType]
  field :pricing, Types::ObjectType
end
