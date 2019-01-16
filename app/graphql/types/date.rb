# frozen_string_literal: true

module Types
  Date = GraphQL::ScalarType.define do
    name 'Date'
    description 'Date in ISO 8601 format (yyyy-mm-dd)'

    coerce_input lambda { |value, _ctx|
      ::Date.parse(value) if value.present?
    }
    coerce_result ->(value, _ctx) { value.iso8601 }
  end
end
