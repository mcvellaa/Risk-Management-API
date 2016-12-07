class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  # GET /invitations
  # GET /invitations.json
  def index
    @guests = (Invitation.for_user_and_event(User.find_by(auth_token:request.headers['AuthorizationToken'].to_s).id, Event.find_by(id:request.headers['EventId'].to_s).id)).map(&:guest)

    render json: @guests
  end

  # GET /invitations/1
  # GET /invitations/1.json
  def show
    render json: @invitation
  end

  # GET /invitations/new
  #def new
  #  @invitation = Invitation.new
  #end

  # GET /invitations/1/edit
  #def edit
  #end

  # POST /invitations
  # POST /invitations.json
  def create
    @invitation = Invitation.new(invitation_params)
  
    if @invitation.save
      render json: @invitation, status: :created, location: @invitation 
    else
      render json: @invitation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /invitations/1
  # PATCH/PUT /invitations/1.json
  def update
    @invitation = Invitation.find(params[:id])

    if @invitation.update(invitation_params)
      head :no_content
    else
      render json: @invitation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.json
  def destroy
    @invitation.destroy
    
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invitation_params
      params.require(:invitation).permit(:guest_id, :event_id, :user_id)
    end
end
