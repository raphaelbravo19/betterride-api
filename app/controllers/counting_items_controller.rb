class CountingItemsController < ApplicationController
  before_action :set_counting_item, only: [:show, :update, :destroy]

  # GET /counting_items
  def index
    counting_items = CountingItem.all

    render json: {status: 'SUCCESS', message: "Load counting_items", data: counting_items}, include: :lanes_count
  end

  # GET /counting_items/1
  def show
    render json: {status: 'SUCCESS', message: "Load counting_item", data: @counting_item}, include: :lanes_count
  end

  # POST /counting_items
  def create
    @counting_item = CountingItem.new(counting_item_params)

    if @counting_item.save
      render json: @counting_item, status: :created, location: @counting_item
    else
      render json: @counting_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /counting_items/1
  def update
    if @counting_item.update(counting_item_params)
      render json: @counting_item
    else
      render json: @counting_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /counting_items/1
  def destroy
    @counting_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_counting_item
      @counting_item = CountingItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def counting_item_params
      params.permit(:hour, :type_vehicle, :turn, :lanes_count_id)
    end
end
