require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '商品購入機能' do
    context '商品が購入できる' do
      it 'address, postal_code, city, building, phone_number, delivery_prefecture, token, price, 
      user_id, item_id があれば購入できる' do
        expect(@order_form).to be_valid
      end
      it 'postal_code が8桁以下且つ、半角数値であれば購入できる' do
        @order_form.postal_code = ('000-0000')
        expect(@order_form).to be_valid
      end
      it 'postal_code が3桁ハイフン4桁であれば購入できる' do
        @order_form.postal_code = ('123-1234')
        expect(@order_form).to be_valid
      end
      it 'phone_number が11桁以下且つ、半角整数値であれば購入できる' do
        @order_form.phone_number = ('0' * 11) 
        expect(@order_form).to be_valid
      end
      it 'building が空でも購入できる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '商品が購入できない' do 
      it 'address が空だと購入できない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'postal_code が空だと購入できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_code が3桁未満ハイフン4桁未満だと購入できない' do
        @order_form.postal_code = '00-000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_code が全角ハイフン数値だと購入できない' do
        @order_form.postal_code = '１２３−４５６７'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end
      it 'postal_code が半角ハイフンを含む形式ではないと購入できない' do
        @order_form.postal_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code is invalid")
      end
      it 'city が空だと購入できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end
      it 'phone_number が空だと購入できない' do
        @order_form.phone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_number にハイフンがあると購入できない' do
        @order_form.phone_number = '000-0000-0000'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is not a number")
      end
      it 'phone_number が全角整数値だと購入できない' do
        @order_form.phone_number = '１２３４５６７８９１２'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is not a number")
      end
      it 'phone_number が12桁以上だと購入できない' do
        @order_form.phone_number = '123456789123'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'delivery_prefecture_id が0だと購入できない' do
        @order_form.delivery_prefecture_id = 0
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Delivery prefecture must be other than 0")
      end
      it 'token が空だと購入できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
      it 'price が空だと購入できない' do
        @order_form.price = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Price can't be blank")
      end
      it 'item の情報がないと購入できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'user の情報がないと購入できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end
