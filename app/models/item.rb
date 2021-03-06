class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_one :order, dependent: :destroy

  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status

  with_options presence: true do
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
    validates :images
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
  end

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :prefecture_id
    validates :sales_status_id
    validates :scheduled_delivery_id
    validates :shipping_fee_status_id
  end
end
