class AvenuesController < ApplicationController
  before_action :set_avenue, only: [:show, :update, :destroy]

  # GET /avenues
  def index
    avenues = Avenue.all

    render json: {status: 'SUCCESS', message: "Load avenues", data: avenues}, include: :junction
  end

  # GET /avenues/1
  def show
    render json: {status: 'SUCCESS', message: "Load avenue", data: @avenue}, include: :junction
  end

  # POST /avenues
  def create
    @avenue = Avenue.new(avenue_params)

    if @avenue.save
      render json: @avenue, status: :created, location: @avenue
    else
      render json: @avenue.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /avenues/1
  def update
    if @avenue.update(avenue_params)
      render json: @avenue
    else
      render json: @avenue.errors, status: :unprocessable_entity
    end
  end

  # DELETE /avenues/1
  def destroy
    @avenue.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_avenue
      @avenue = Avenue.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def avenue_params
      params.permit(:name, :n_lane, :junction_id)
    end
end
