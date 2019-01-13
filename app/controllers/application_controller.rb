class ApplicationController < ActionController::API
	rescue_from GraphQL::ExecutionError, with: :render_unauthorized

	def render_unauthorized(_err)
    render status: :unauthorized, json: { errors: [{ message: 'UNAUTHORIZED' }] }
  end
end
