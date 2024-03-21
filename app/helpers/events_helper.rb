module EventsHelper
  def enroll_button
    if @enrollment.nil?
      link_to 'Enroll', event_enrollments_path(@event), data: { turbo_method: :post }
    else
      link_to 'Disenroll', event_enrollment_path(@event, @enrollment), data: { turbo_method: :delete }
    end
  end
end
