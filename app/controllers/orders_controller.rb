class OrdersController < ApplicationController

  def new
    @order = Order.new
  end
  def edit
    @order = Order.find(params[:id])
  end
def index
  @orders = Order.all
  @customers = Customer.all




end
  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order
    else
      render :new
    end
  end

  def show
    @order = Order.find(params[:id])
  end
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
if @order.save

    redirect_to order_path(@order)
else
  render :edit
end
  end

  def destroy
    @order = Order.find(params[:id])
    @order.destroy
    redirect_to orders_path
  end

  private

  def order_params
    params.require(:order)
          .permit(:customer_id, :product_name, :product_count)
  end


end
