class Listing < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :item
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_payer
  belongs_to :prefecture
  belongs_to :scheduled_delivery
end
