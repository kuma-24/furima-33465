require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品が出品できるとき' do
      it 'category, prefecture, sales, scheduled_delivery, shipping_fee_status, name, info, price, image, user
      が存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it 'name が40文字までなら出品できる' do
        @item.name = ('a' * 40)
        expect(@item).to be_valid
      end
      it 'info が1000文字までなら出品できる' do
        @item.info = ('a' * 1000)
        expect(@item).to be_valid
      end
      it 'price が300以上9999999未満であれば出品できる' do
        @item.price = (expect(@item).to be_valid if 300 <= 9_999_999 && 9_999_999 >= 300)
      end
    end

    context '商品が出品できないとき' do
      it 'name が空では出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'name が41文字以上は出品できない' do
        @item.name = ('a' * 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Name is too long (maximum is 40 characters)')
      end

      it 'info が空では出品できない' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'info が1001文字以上は出品できない' do
        @item.info = ('a' * 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Info is too long (maximum is 1000 characters)')
      end

      it 'price が空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'price が299未満は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'price が10000000以上は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'price が全角整数値では出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
      it 'price が半角浮動小数では出品できない' do
        @item.price = 300.5
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be an integer')
      end

      it 'image が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'user と関係性が無いと出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end

      it 'category が空では出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category is not a number')
      end
      it 'prefecture が空では出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture is not a number')
      end
      it 'sales_status が空では出品できない' do
        @item.sales_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status is not a number')
      end
      it 'scheduled_delivery が空では出品できない' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery is not a number')
      end
      it 'shipping_fee_status が空では出品できない' do
        @item.shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status is not a number')
      end
    end
  end
end
