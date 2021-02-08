class Order < ApplicationRecord
  attr_accessor :price, :token

  belongs_to :user 
  belongs_to :item 
  has_one :shipping_address, dependent: :destroy
end
