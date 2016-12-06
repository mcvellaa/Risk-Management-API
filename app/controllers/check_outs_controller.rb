class CheckOutsController < ApplicationController
  before_action :set_check_out, only: [:show, :edit, :update, :destroy]

  # GET /check_outs
  # GET /check_outs.json
  def index
    @check_outs = CheckOut.all

    render json: @check_outs
  end

  # GET /check_outs/1
  # GET /check_outs/1.json
  def show
    render json: @check_out
  end

  # GET /check_outs/new
  #def new
  #  @check_out = CheckOut.new
  #end

  # GET /check_outs/1/edit
  #def edit
  #end

  # POST /check_outs
  # POST /check_outs.json
  def create
    @inv = Invitation.for_guest_and_event(request.headers['guest_id'].to_s, request.headers['event_id'].to_s).first
    @check_out = CheckOut.new()
    @check_out.user_id = User.find_by(auth_token:request.headers['AuthorizationToken'].to_s).id
    @check_out.invitation_id = @inv.id
    @inv.update(checked_in:false)

    if @check_out.save
      render json: @check_out, status: :created, location: @check_out
    else
      render json: @check_out.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /check_outs/1
  # PATCH/PUT /check_outs/1.json
  def update
    @check_out = CheckOut.find(params[:id])
  
    if @check_out.update(check_out_params)
      head :no_content
    else
      render json: @check_out.errors, status: :unprocessable_entity
    end
  end

  # DELETE /check_outs/1
  # DELETE /check_outs/1.json
  def destroy
    @check_out.destroy
    
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_check_out
      @check_out = CheckOut.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def check_out_params
      params.require(:check_out).permit()
    end
end
