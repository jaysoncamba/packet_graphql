namespace :graphql do
  namespace :schema do
    task idl: [:environment] do
      # Get a string containing the definition in GraphQL IDL:
      schema_defn = PacketGraphqlSchema.to_definition
      # Choose a place to write the schema dump:
      schema_path = 'app/graphql/schema.graphql'
      # Write the schema dump to that file:
      File.write(Rails.root.join(schema_path), schema_defn)
      puts "Updated #{schema_path}"
    end

    task json: [:environment] do
      result = PacketGraphqlSchema.execute(GraphQL::Introspection::INTROSPECTION_QUERY)
      target = Rails.root.join('app/graphql/schema.json')
      File.open(target, 'w+') do |f|
        f.write(JSON.pretty_generate(result))
      end
      puts 'Schema dumped into app/graphql/schema.json'
    end

    task dump: ['graphql:schema:idl', 'graphql:schema:json']
  end
end
