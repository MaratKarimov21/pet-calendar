# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!
   
  expose :events, :filtered_events
  expose :event , scope: -> { current_user.events }

  def index
    #@events = current_user.events.all
  end

  # def showAll
  #   #@events = current_user.events.all
  #   @date = params[:date]
  # end

  def show
  end

  def new    
  end

  def create
    if event.save
      redirect_to event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if event.update(event_params)
      redirect_to event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    event.destroy
    redirect_to root_path
  end

  private

  def filtered_events
    FilteredEventsQuery.new(raw_relation, filter_params).all
  end

  def filter_params
    params.permit(:date).to_h
  end

  def raw_relation
    current_user.events
  end

  def event_params
    params.require(:event).permit(:date, :body)
  end
end
