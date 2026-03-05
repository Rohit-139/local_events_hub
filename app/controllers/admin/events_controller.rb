class Admin::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_admin
  before_action :set_event , only: [:show, :edit, :update, :destroy ]

  def index
    @events = Event.all
  end

  def new 
    @event = Event.new 
  end

  def create 
    @event = Event.new(event_params) 
    if @event.save 
      respond_to do |format|
        format.json { render json: @event}
        format.html {redirect_to admin_events_path}
      end
    else 
      respond_to do |format|
        format.json {render json: {errors: @event.errors.full_messages}, status: :unprocessable_entity}
        format.html {render :new, status: :unprocessable_entity}
      end
    end
  end

  def edit 
    
  end

  def update
    if @event.update(event_params)
      redirect_to admin_event_path
    else
      render :edit , status: :unprocessable_entity
    end
  end

  def show 
  end

  def destroy 
    @event.destroy 
    respond_to do |format|
      format.html {redirect_to  admin_events_path}
      format.turbo_stream {flash.now[:notice]= "Event was succesfully deleted"}
    end
  end


  private
  def check_admin
  redirect_to root_path unless current_user.admin?
  end

  def event_params 
    # params.permit(:name, :description, :total_seat, :ticket_price, :city, :street, :state, :image)
  params.require(:event).permit(:name, :description, :total_seat, :ticket_price, :city, :street, :state, :image)
  end

  def set_event
    @event = Event.find(params[:id])
  end

end
