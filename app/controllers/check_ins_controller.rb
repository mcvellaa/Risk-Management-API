class CheckInsController < ApplicationController
  before_action :set_check_in, only: [:show, :edit, :update, :destroy]

  # GET /check_ins
  # GET /check_ins.json
  def index
    @check_ins = CheckIn.all

    render json: @check_ins
  end

  # GET /check_ins/1
  # GET /check_ins/1.json
  def show
    render json @check_in 
  end

  # GET /check_ins/new
  # def new
  #   @check_in = CheckIn.new
  # end

  # GET /check_ins/1/edit
  # def edit
  # end

  # POST /check_ins
  # POST /check_ins.json
  def create
    #@check_in = CheckIn.new(check_in_params_for_create)
    #@check_in.user_id = User.find_by(auth_token:request.headers['AuthorizationToken'].to_s).id
    @inv = Invitation.for_guest_and_event(request.headers['guest_id'], request.headers['event_id']).first
    @check_in = CheckIn.new()
    @check_in.user_id = User.find_by(auth_token:request.headers['AuthorizationToken'].to_s).id
    @check_in.invitation_id =  @inv.id
    @inv.update(checked_in:true)

    if @check_in.save
      render json: @check_in, status: :created, location: @check_in
    else
      render json: @check_in.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /check_ins/1
  # PATCH/PUT /check_ins/1.json
  def update
    @check_in = CheckIn.find(params[:id])

    if @check_in.update(check_in_params)
      head :no_content
    else
      render json: @check_in.errors, status: :unprocessable_entity
    end
  end

  # DELETE /check_ins/1
  # DELETE /check_ins/1.json
  def destroy
    @check_in.destroy
    
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_in
      @check_in = CheckIn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_in_params
      params.require(:check_in).permit()
    end
end
