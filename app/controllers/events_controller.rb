class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.for_user(request.headers['AuthorizationToken'].to_s)

    render json: @events 
  end

  # GET /events/1
  # GET /events/1.json
  def show
    render json: @event
  end

  # GET /events/new
  #def new
  #  @event = Event.new
  #end

  # GET /events/1/edit
  #def edit
  #end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.admin_invite_code = Event.invite_code
    @event.team_invite_code = Event.invite_code
    @event.member_invite_code = Event.invite_code

    auth_header = request.headers['AuthorizationToken'].to_s
    @event_user = EventUser.new()
    @event_user.user_id = User.find_by(auth_token:auth_header).id
    @event_user.event_id = @event.id
    @event_user.role = "Admin"

    if @event.save and @event_user.save
      render json: @event, status: :created, location: @event
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      head :no_content
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :location, :start, :end, :max_attendance, :time_to_send_invites, :list_close)
    end
end
