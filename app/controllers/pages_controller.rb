# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authenticate_user!

  def main
    @date = parsed_params || Date.today
    @grouped_events = filtered_events.group_by { |event| event.date.day.to_s }
  end

  def profile
  end

  private

  def parsed_params
    begin
      Date.parse(params[:date])
    rescue
      nil
    end
  end

  def filtered_events
    FilteredEventsQuery.new(raw_relation, filter_params).all
  end

  def filter_params
    {
      date_from: @date.beginning_of_month,
      date_until: @date.end_of_month
    }
  end

  def raw_relation
    current_user.events
  end
    
  def date_params
    params.permit(:date)
  end
end
