if defined?(GraphiQL::Rails)
  GraphiQL::Rails.config.tap do |config|
    config.headers['X-APP-ID'] = ->(context) {
    	context.params['x_app_id']
    }
  end
end