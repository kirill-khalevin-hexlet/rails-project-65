class HealthController < ApplicationController
  def status
    render json: { status: :ok }, status: :ok
  end
end
