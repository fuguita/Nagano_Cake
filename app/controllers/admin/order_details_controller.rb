class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details.all

    is_updated = true
    if @order_detail.update(order_detail_params)
      if @order_detail.making_status == 'making'
        @order.update(status: 2)
      end
        @order_details.each do |order_detail|
      if order_detail.making_status != 'made_up'
         is_updated = false
      end
        end
      if is_updated
       @order.update(status: 3)
      end
    end
    redirect_to admin_order_path(@order)
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end

end
