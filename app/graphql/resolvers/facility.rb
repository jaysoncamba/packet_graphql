class Resolvers::Facility
  def call(code, _ctx)
    Packet::Facility.new(code: code)
  end
end