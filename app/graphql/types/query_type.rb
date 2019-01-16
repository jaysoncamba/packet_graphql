# frozen_string_literal: true

Types::QueryType = GraphQL::ObjectType.define do
  name 'Query'

  connection :operatingSystems, Types::OperatingSystem.connection_type do
    description 'List of all available Operating System'
    resolve lambda { |_object, _args, ctx|
      ctx[:client].list_operating_systems
    }
  end

  connection :projectPlans, Types::Plan.connection_type do
    description 'List of all available plan from project'
    argument :projectId, !types.String, as: :project_id
    resolve lambda { |_object, args, ctx|
              ctx[:client].list_project_plans(args[:project_id])
            }
  end

  connection :projectFacilities, Types::Facility.connection_type do
    description 'List of the project available facilities'
    argument :projectId, !types.String, as: :project_id
    resolve lambda { |_object, args, ctx|
      ctx[:client].list_project_facilities(args[:project_id])
    }
  end

  connection :projectDevices, Types::Device.connection_type do
    description 'List all devices in a project'
    argument :projectId, !types.String, as: :project_id
    resolve lambda { |_object, args, ctx|
      ctx[:client].list_devices(args[:project_id])
    }
  end

  field :projectDevice, Types::Device do
    description 'Get Project device by ID'
    argument :deviceId, !types.String, as: :device_id
    resolve lambda { |_object, args, ctx|
      ctx[:client].get_device(args[:device_id])
    }
  end
end
