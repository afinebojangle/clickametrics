class API::EventsController < ApplicationController

  skip_before_action :verify_authenticity_token

  before_filter :cors_preflight_check
  after_filter :cors_set_access_control_headers

  def create
    @website = Website.find_by(url: request.env['HTTP_ORIGIN'])
    if @website.nil?
      render json: "Unregistered Application", status: :unprocessable_entity
    else
      @event = @website.events.build(event_params)
        if @event.save
          render json: @event, status: :created
        else
          render @event.errors, status: :unprocessable_entity
        end
    end
  end

private
  def event_params
    params.permit(:name)
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    headers['Access-Control-Max-Age'] = "1728000"
  end
 
  def cors_preflight_check
    if request.method == 'OPTIONS'
      headers['Access-Control-Allow-Origin'] = '*'
      headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, DELETE, OPTIONS'
      headers['Access-Control-Allow-Headers'] = 'X-Requested-With, X-Prototype-Version, Token'
      headers['Access-Control-Max-Age'] = '1728000'
 
      render :text => '', :content_type => 'text/plain'
    end
  end
end