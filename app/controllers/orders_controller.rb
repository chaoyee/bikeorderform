class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  add_breadcrumb 'orders', :orders_path

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all.page(params[:page]).per_page(3)
    respond_to do |format|
      format.html
      format.json
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  # GET /orders/1.csv
  def show
    @orderdetails = @order.orderdetails
    add_breadcrumb @order.id, order_path

    respond_to do |format|
      format.html
      format.json
      fn = "order_#{@order.po_number}_#{Time.now.strftime("%Y-%m-%d %H:%M:%S")}.csv"

      # Send_data method and exec_query approach
      format.csv { send_data query_to_csv(@order.id), filename: fn }
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
    add_breadcrumb 'new', new_order_path
  end

  # GET /orders/1/edit
  def edit
    @orderdetails = @order.orderdetails
    add_breadcrumb @order.id, edit_order_path
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to orders_path, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to orders_path, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Use ActiveRecord::Base.connection.exec_query to query db directly only once.
    def query_to_csv(order_id)
      query_string = "select a.po_number as 'PO Number', c.name as 'Model Name', d.name as 'Color',
          e.name as 'Size', b.price as 'Price', b.quantity as Quantity,
          (b.price*b.quantity) as 'Total Amount'
        from orders a, orderdetails b, models c, colors d, sizes e
        where a.id = b.order_id and b.model_id=c.id and b.color_id=d.id and b.size_id=e.id and b.order_id=#{order_id}"
      results = ActiveRecord::Base.connection.exec_query(query_string)
      CSV.generate(headers: true) do |csv|
        csv << results.columns
        results.rows.each do |row|
          csv << row
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:po_number, :shipment_require_date, :order_date, :ship_to, :reference,
                                      orderdetails_attributes: [
                                        :id,
                                        :model_id,
                                        :size_id,
                                        :color_id,
                                        :price,
                                        :quantity])
    end
end
