class EnrollmentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @enrollment = current_user.enrollments.new(event_id: params[:event_id])

    if @enrollment.save
      redirect_to event_path(params[:event_id])
    else
      render :show, status: :unprocessable_entity
    end
  end

  def destroy
    @enrollment = Enrollment.find(params[:id])

    @enrollment.destroy

    redirect_to event_path(params[:event_id])
  end
end
