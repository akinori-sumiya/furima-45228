class ItemsController < ApplicationController
  def index
  end
end

private

def item_params
  params.require(:item).permit(:image, :name, :info, :category_id, :sales_status_id, :shipping_fee_payer_id, :prefecture_id,
                               :scheduled_delivery_id, :price).merge(user_id: current_user.id)
end
