class OrderForm
  include ActiveModel::Model
  attr_accessor :token, :price, :postal_code, :city, :address, :building, :phone_number, :delivery_prefecture_id, :item_id, :user_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :city
    validates :address
    validates :phone_number, numericality: { only_integer: true }, length: { maximum: 11 }
    validates :delivery_prefecture_id, numericality: { other_than: 0 }
    validates :item_id
    validates :user_id
    
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    ShippingAddress.create(
      postal_code: postal_code, 
      city: city, 
      building: building,
      address: address, 
      phone_number: phone_number, 
      delivery_prefecture_id: delivery_prefecture_id,
      order_id: order.id
    )
  end
end
