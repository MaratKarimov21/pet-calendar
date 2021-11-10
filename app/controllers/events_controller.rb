# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!
   
  expose :events, :filtered_events
  expose :event , scope: -> { current_user.events }

  def index
  end

  def show
  end

  def new    
  end

  def create
    event.save
    respond_with event
  end

  def edit
  end

  def update
    event.update(event_params)
    respond_with event
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
    params.permit(:date, :from, :to).to_h
  end

  def raw_relation
    current_user.events
  end

  def event_params
    params.require(:event).permit(:date, :body)
  end
end
