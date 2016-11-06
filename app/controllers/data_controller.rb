class DataController < ApplicationController
  before_action :set_datum, only: [:show, :edit, :update, :destroy]

  # GET /data
  # GET /data.json
  def index
    @data = Datum.all

    render json: @data
  end

  # GET /data/1
  # GET /data/1.json
  def show
    render json: @datum
  end

  # GET /data/new
  #def new
  #  @datum = Datum.new
  #end

  # GET /data/1/edit
  #def edit
  #end

  # POST /data
  # POST /data.json
  def create
    @datum = Datum.new(datum_params)

    if @datum.save
      render json: @datum, status: :created, location: @datum
    else
      render json: @datum.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /data/1
  # PATCH/PUT /data/1.json
  def update
    @datum = Datum.find(params[:id])

    if @datum.update(datum_params)
      head :no_content
    else
      render json: @assignment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /data/1
  # DELETE /data/1.json
  def destroy
    @datum.destroy
    
    head :no_content
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datum
      @datum = Datum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datum_params
      params.require(:datum).permit(:user_id, :event_id, :question_id, :response)
    end
end
