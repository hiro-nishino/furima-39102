require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user =FactoryBot.create(:user)
    @item =FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
    sleep 0.6
  end

  context '商品購入できるとき' do
    it "配送先情報とtokenがあれば保存ができる" do
      expect(@order_address).to be_valid
    end

    it "building_nameが空でも保存できる" do
      @order_address.building_name = ""
      expect(@order_address).to be_valid
    end
  end

  context '商品購入できないとき' do
    it "post_codeが『3桁の半角数字 + (-) + 4桁の半角数字以外』では保存ができないこと" do
      @order_address.post_code = "1234-1234"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post codeis invalid. Include hyphen(-)")
    end

    it "post_codeが空では登録できないこと" do
      @order_address.post_code = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post codeを入力してください",)
    end

    it 'prefecture_idが0では登録できない' do
      @order_address.prefecture_id = '0'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefectureは0以外の値にしてください")
    end


    it "prefecture_idが空では登録できないこと" do
      @order_address.prefecture_id = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefectureを入力してください")
    end

    it "cityが空では登録できないこと" do
      @order_address.city = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Cityを入力してください")
    end

    it "addressesが空では登録できないこと" do
      @order_address.addresses = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Addressesを入力してください")
    end


    it "phone_numberが空では登録できないこと" do
      @order_address.phone_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone numberを入力してください")
    end

    it "phone_numberが9桁以下では登録できないこと" do
      @order_address.phone_number = '09011111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone numberは不正な値です")
    end

    it "phone_numberが12桁以上では登録できないこと" do
      @order_address.phone_number = '090111111111111'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone numberは不正な値です")
    end

    it "tokenが空では登録できないこと" do
      @order_address.token = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Tokenを入力してください")
    end

    it 'userが紐付いていないと保存できない' do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Userを入力してください")
    end

    it 'itemが紐付いていないと保存できない' do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Itemを入力してください")
    end
  end
end