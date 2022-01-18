class MembershipsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

  def create
    membership = Membership.create!(mem_params)
    render json: membership, status: :created
  end

  private

  def mem_params
    params.permit(:gym_id, :client_id, :charge)
  end

  def invalid_record(e)
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end
end
