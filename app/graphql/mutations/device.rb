module Mutations
  module Device
    CreateDevice = GraphQL::Relay::Mutation.define do
      name 'CreateDevice'
      description 'Create Device for a Project'
      input_field :projectId, !types.String, as: :project_id
      input_field :planSlug, !types.String, as: :plan, prepare: Resolvers::Plan.new
      input_field :operatingSystemSlug, !types.String, as: :operating_system, prepare: Resolvers::OperatingSystem.new
      input_field :facilityCode, !types.String, as: :facility, prepare: Resolvers::Facility.new
      return_type Types::Device
      resolve ->(_obj, args, ctx) {
        device = 
          Packet::Device.new(
            project_id: args[:project_id],
            plan: args[:plan].to_hash,
            operating_system: args[:operating_system].to_hash,
            facility: args[:facility].to_hash
          )
        ctx[:client].create_device(device)
        device
      }
    end

    DeleteDevice = GraphQL::Relay::Mutation.define do
      name 'DeleteDevice'
      description 'Delete Device by ID'
      input_field :deviceId, !types.String, as: :device_id
      return_type Types::SuccessResponse
      resolve ->(_obj, args, ctx) {
        ctx[:client].delete_device(args[:device_id])
        { success: true }
      }
    end
  end
end
