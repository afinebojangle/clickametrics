class API::EventsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def create
    @website = Website.find_by(url: request.env['HTTP_ORIGIN'])
    if @website.nil?
      render json: "Unregistered Application", status: :unprocessable_entity
    else
      @event = @website.event.build(event_params)
        if @event.save
          render json: @event, status: :created
        else
          render @event.errors, status: :unprocessable_entity
        end
    end
  end


  private
  def event_params
    params.require(:event).permit(:name)
  end
end