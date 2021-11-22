# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!
   
  expose :events, -> { filtered_events.decorate }
  expose :event, scope: -> { raw_relation }, decorate: ->(event){ EventDecorator.new(event) }

  def index
    if filter_params.present?
      @public_events = GetPublicEvents.call(filter_params).events
    end
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
    params.permit(:date, :date_from, :date_until).to_h
  end

  def raw_relation
    current_user.events
  end

  def event_params
    params.require(:event).permit(:date, :body)
  end
end
