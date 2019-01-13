# from https://github.com/howtographql/graphql-ruby/blob/master/app/graphql/types/date_time_type.rb
module Types
  DateTime = GraphQL::ScalarType.define do
    name 'DateTime'
    description <<~DESC
      DateTime in ISO 8601 format("yyyy-mm-ddThh:mm:ssZ").\n
      Ex. "Wed, 11 Apr 2018 06:23:15 UTC +00:00" when encoded to iso8601\n
      looks like "2018-04-11T06:23:40Z"
    DESC

    coerce_input ->(value, _ctx) {
      Time.zone.parse(value) if value.present?
    }
    coerce_result ->(value, _ctx) { value.utc.iso8601 }
  end
end
