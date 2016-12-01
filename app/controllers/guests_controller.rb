pclass GuestsController < ApplicationController
  before_action :set_guest, only: [:show, :edit, :update, :destroy]

  # GET /guests
  # GET /guests.json
  def index
    @guests = Guest.all

    render json: @guests
  end

  # GET /guests/1
  # GET /guests/1.json
  def show
    render json: @guest
  end

  # GET /guests/new
  #def new
  #  @guest = Guest.new
  #end

  # GET /guests/1/edit
  #def edit
  #end

  # POST /guests
  # POST /guests.json
  def create
    #create the guest
    @guest = Guest.new(guest_params)

    #save the guest and create the invitation
    if @guest.save
      @inv = Invitation.new()
      @inv.guest_id = @guest.id
      @inv.event_id = Event.find_by(id:request.headers['EventId'].to_s).id
      @inv.user_id = User.find_by(auth_token:auth_header).id
    end

    #save the invitation and return the guest
    if @inv.save
      render json: @guest, status: :created, location: @guest
    else
      render json: @guest.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    @guest = Guest.find(params[:id])

    if @guest.update(guest_params)
      head :no_content
    else
      render json: @guest.errors, status: :unprocessable_entity
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest.destroy
    
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guest
      @guest = Guest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guest_params
      params.require(:guest).permit(:name, :optional_title, :optional_text, :phone, :birthdate, :texting_consent)
    end
end
