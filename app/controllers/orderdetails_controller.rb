class OrderdetailsController < ApplicationController
  before_action :set_orderdetail, only: [:show, :edit, :update, :destroy]

  # GET /orderdetails
  # GET /orderdetails.json
  def index
    @orderdetails = Orderdetail.all
  end

  # GET /orderdetails/1
  # GET /orderdetails/1.json
  def show
  end

  # GET /orderdetails/new
  def new
    @order = Order.find(params[:order_id])
    @orderdetail = Orderdetail.new
    @orderdetail.order_id = @order.id
    @orderdetail.model_id = 1   # initial value
    @orderdetail.price = Model.first.price
  end

  # GET /orderdetails/1/edit
  def edit
    @order = Order.find(@orderdetail.order_id)
  end

  # POST /orderdetails
  # POST /orderdetails.json
  def create
    @orderdetail = Orderdetail.new(orderdetail_params)
    @orderdetail.order_id = params[:order_id]
    @orderdetail.price    = @orderdetail.model.price
    respond_to do |format|
      if @orderdetail.save
        format.html { redirect_to order_path(@orderdetail.order_id), notice: 'Orderdetail was successfully created.' }
        format.json { render :show, status: :created, location: @orderdetail }
      else
        format.html { redirect_to new_order_orderdetail_path(@orderdetail.order_id), alert: "#{@orderdetail.errors.full_messages}, Orderdetail was not saved!" }  # render :new
        format.json { render json: @orderdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orderdetails/1
  # PATCH/PUT /orderdetails/1.json
  def update
    respond_to do |format|
      if @orderdetail.update(orderdetail_params)
        format.html { redirect_to order_path(@orderdetail.order_id), notice: 'Orderdetail was successfully updated.' }
        format.json { render :show, status: :ok, location: @orderdetail }
      else
        format.html { redirect_to edit_order_orderdetail_path(@orderdetail), alert: "#{@orderdetail.errors.full_messages}, Orderdetail was not saved!" }  #render :edit
        format.json { render json: @orderdetail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orderdetails/1
  # DELETE /orderdetails/1.json
  def destroy
    @orderdetail.destroy
    respond_to do |format|
      format.html { redirect_to order_path(@orderdetail.order_id), notice: 'Orderdetail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_info
    @model  = Model.find(params[:model_id])
    @sizes  = @model.sizes
    @colors = @model.colors
    respond_to do |format|
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orderdetail
      @orderdetail = Orderdetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def orderdetail_params
      params.require(:orderdetail).permit(:order_id, :model_id, :size_id, :color_id, :price, :quantity)
    end
end
