# frozen_string_literal: true

class Resolvers::OperatingSystem
  def call(slug, _ctx)
    Packet::OperatingSystem.new(slug: slug)
  end
end
