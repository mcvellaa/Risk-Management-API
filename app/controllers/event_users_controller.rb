class EventUsersController < ApplicationController
  before_action :set_event_user, only: [:show, :edit, :update, :destroy]

  # GET /event_users
  # GET /event_users.json
  def index
    @event_users = EventUser.all

    render json: @event_users
  end

  # GET /event_users/1
  # GET /event_users/1.json
  def show
    render json: @event_user
  end

  # GET /event_users/new
  #def new
  #  @event_user = EventUser.new
  #end

  # GET /event_users/1/edit
  #def edit
  #end

  # POST /event_users
  # POST /event_users.json
  def create
    @event_user = EventUser.new(event_user_params)

    if @event_user.save
      render json: @event_user, status: :created, location: @event_user
    else
      render json: @event_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /event_users/1
  # PATCH/PUT /event_users/1.json
  def update
    @event_user = EventUser.find(params[:id])

    if @event_user.update(event_user_params)
      head :no_content
    else
      render json: @assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /event_users/1
  # DELETE /event_users/1.json
  def destroy
    @event_user.destroy
    
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_user
      @event_user = EventUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_user_params
      params.require(:event_user).permit(:event_id, :user_id, :role, :last_location, :location_datetime)
    end
end
