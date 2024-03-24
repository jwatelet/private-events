class EventsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @events = if params[:filter] == "past"
                Event.joins(:creator).past
              elsif params[:filter] == "future"
                Event.joins(:creator).future
              else
                Event.joins(:creator).all
              end
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @event = Event.find(params[:id])
    @enrollment = @event.enrollments.find_by(event_id: params[:id])
    @attendees = @event.attendees
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date)
  end
end
