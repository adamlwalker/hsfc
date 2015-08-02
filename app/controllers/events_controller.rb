class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def destroy
    @event.destroy
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  def update
    @event.update(event_params)
    redirect_to events_path
  end

  private def set_event
    @event = Event.find(params[:id])
  end

  private def event_params
    params.require(:event).permit(:date, :title, :description)
  end
end
