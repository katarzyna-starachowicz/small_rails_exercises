class EventsController < ApplicationController
  #include ApplicationHelper
  def new
    @event = current_user.created_events.build
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:notice] = "A new event created."
      redirect_to event_path(@event)
    else
      flash.now[:notice] = "Something went wrong."
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def index
    @events = Event.all
  end

  private

    def event_params
      params.require(:event).permit(:title, :date, :description)
    end
end
