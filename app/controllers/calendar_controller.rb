require 'google_calendar'

class CalendarController < ApplicationController
  
  def index
  	@events = calendar.events
  end

  def create
    event_params = params[:event]

    @event = calendar.create_event do |e|
      e.title = event_params[:title]
      e.start_time = Time.parse( event_params[:start_time] )
      e.end_time = Time.parse( event_params[:end_time] )
    end
  end

  def edit
    @event = calendar.find_event_by_id( params[:id] )
  end

  def update
    @event = cal.find_or_create_event_by_id( params[:id] ) do |e|
      e.title = event_params[:title]
      e.start_time = Time.parse( event_params[:start_time] )
      e.end_time = Time.parse( event_params[:end_time] )
    end
  end

  private

  def calendar
    @calendar ||= begin
      config = YAML.load(
        ERB.new(
          File.read(
            Rails.root.join('config', "google_api.yml"
        ))).result)[(Rails.env || 'development')]

      Google::Calendar.new(
        :username => config['username'],
        :password => config['password'],
        :app_name => config['app_name'])
    end
  end

end
