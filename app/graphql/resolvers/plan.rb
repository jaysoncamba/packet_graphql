class Resolvers::Plan
  def call(slug, _ctx)
    Packet::Plan.new(slug: slug)
  end
end