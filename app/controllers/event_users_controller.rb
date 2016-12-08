class EventUsersController < ApplicationController
  before_action :set_event_user, only: [:show, :edit, :update, :destroy]

  # GET /event_users
  # GET /event_users.json
  def index
    @event_users = Event.find_by(id:request.headers['EventId'].to_s).event_users

    render json: @event_users
  end

  def geteventuserobjects
    @Users = (EventUser.for_event(Event.find_by(id:request.headers['EventId'].to_s).id)).map(&:user)

    render json: @Users
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
    @event_user = EventUser.new()

    auth_header = request.headers['AuthorizationToken'].to_s
    @event_user.user_id = User.find_by(auth_token:auth_header).id

    invite_code = request.headers['InviteCode'].to_s
    if Event.find_by(admin_invite_code:invite_code)
      @event_user.event_id = Event.find_by(admin_invite_code:invite_code).id
      @event_user.role = "Admin"
    elsif Event.find_by(team_invite_code:invite_code)
      @event_user.event_id = Event.find_by(team_invite_code:invite_code).id
      @event_user.role = "Team"
    elsif Event.find_by(member_invite_code:invite_code)
      @event_user.event_id = Event.find_by(member_invite_code:invite_code).id
      @event_user.role = "Member"
    else 
      render json: @event_user.errors, status: :unprocessable_entity
    end


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
      params.require(:event_user).permit()
    end
end
