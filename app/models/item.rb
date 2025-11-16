class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user

  has_one_attached :image
  has_one :order

  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee_payer
  belongs_to :prefecture
  belongs_to :scheduled_delivery

  # --- バリデーション ---

  # 必須項目の存在チェック
  validates :image, presence: true
  validates :name, presence: true
  validates :info, presence: true

  # ActiveHashを利用した関連付けのバリデーション
  # ActiveHashの最初の項目（id: 1, name: '---'）はプレースホルダーのため選択不可
  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_payer_id
    validates :prefecture_id
    validates :scheduled_delivery_id
  end

  # 価格のバリデーション: 必須、整数、かつ指定範囲内であること
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end
