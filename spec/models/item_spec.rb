require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it 'name,detail,item_category_id,item_condition_id,shipping_charge_id,prefecture_id,days_to_ship_id,priceが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      it 'nameが空では登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Nameを入力してください")
      end
      it 'infoが空では登録できない' do
        @item.detail = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Detailを入力してください")
      end
      it 'item_category_idが1では登録できない' do
        @item.item_category_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item categorycan't be blank")
      end
      it 'item_condition_idが1では登録できない' do
        @item.item_condition_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Item conditioncan't be blank")
      end
      it 'shipping_charge_idが1では登録できない' do
        @item.shipping_charge_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping chargecan't be blank")
      end
      it 'prefecture_idが0では登録できない' do
        @item.prefecture_id = "0"
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecturecan't be blank")
      end
      it 'days_to_ship_idが1では登録できない' do
        @item.days_to_ship_id = "1"
        @item.valid?
        expect(@item.errors.full_messages).to include("Days to shipcan't be blank")
      end
      it 'priceが300円以下では登録できない' do
        @item.price = "299"
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは300以上の値にしてください")
      end
      it 'priceが9,999,999円以上では登録できない' do
        @item.price = "10000000"
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは9999999以下の値にしてください")
      end
      it '値段が半角数字以外では登録できない' do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Priceは数値で入力してください")
      end
      it '商品画像が空では出品出来ない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Imageを入力してください")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price半角数字を入力してください")
      end
      it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
