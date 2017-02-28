class Api::V1::BaseController < ApplicationController
  rescue_from ActionController::ParameterMissing do
    head 400
  end

  rescue_from ActiveRecord::RecordInvalid do
    head 422
  end

  rescue_from ActiveRecord::RecordNotFound do
    head 404
  end
end
