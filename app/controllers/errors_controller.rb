class ErrorsController < ApplicationController
  def not_found
    render status: :not_found
  end

  def forbidden
    render status: :forbidden

  end

  def error
    render status: :internal_server_error
  end
end
