class Api::V1::EventsController < ApplicationController

  def index
    events = Event.all
    render json: events
  end

  def create
    event = Event.create(event_params)
    current_user.events << event
    render json: event
  end


  def update_title
    event = Event.find(params[:event_id])
    title = params[:title]
    event.update_attribute(:title, title)
    render json: event
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    events = Event.all
    render json: events
  end





  private

  def event_params
    params.require(:event).permit(:title, :start, :end)
  end

end
