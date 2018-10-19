class LanesCountsController < ApplicationController
  before_action :set_lanes_count, only: [:show, :update, :destroy]

  # GET /lanes_counts
  def index
    lanes_counts = LanesCount.all

    render json: {status: 'SUCCESS', message: "Load lanes_counts", data: lanes_counts}, include: :user, methods: [:session, :counting_items]
  end

  # GET /lanes_counts/1
  def show
    render json: {status: 'SUCCESS', message: "Load lanes_count", data: @lanes_count}, include: :user, methods: [:session, :counting_items]
  end

  # POST /lanes_counts
  def create
    @lanes_count = LanesCount.new(lanes_count_params)

    if @lanes_count.save
      render json: @lanes_count, status: :created, location: @lanes_count
    else
      render json: @lanes_count.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lanes_counts/1
  def update
    if @lanes_count.update(lanes_count_params)
      render json: @lanes_count
    else
      render json: @lanes_count.errors, status: :unprocessable_entity
    end
  end

  # DELETE /lanes_counts/1
  def destroy
    @lanes_count.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lanes_count
      @lanes_count = LanesCount.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def lanes_count_params
      params.permit(:lane, :user_id, :session_id)
    end
end
