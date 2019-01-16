# frozen_string_literal: true

Types::Project = GraphQL::ObjectType.define do
  name 'Project'
  description 'Project packet object'

  field :id, types.String
  connection :devices, Types::Device
  field :createdAt, Types::DateTime, property: :created_at
  field :updatedAt, Types::DateTime, property: :updated_at
end
