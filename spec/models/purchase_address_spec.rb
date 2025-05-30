require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @purchase_address = FactoryBot.build(:purchase_address, user_id: @user.id, item_id: @item.id)
  end

  context '登録できる場合' do
    it '全ての項目が正しく入力されていれば登録できる' do
      expect(@purchase_address).to be_valid
    end

    it '建物名が空でも保存できる' do
      @purchase_address.building_name = ''
      expect(@purchase_address).to be_valid
    end
  end

  context '登録できない場合' do
    it '郵便番号が空では登録できない' do
      @purchase_address.post_code = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
    end

    it '郵便番号が正しい形式でないと保存できない' do
      @purchase_address.post_code = '12345'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
    end

    it '都道府県が空では登録できない' do
      @purchase_address.prefecture_id = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が空では登録できない' do
      @purchase_address.city = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("City can't be blank")
    end

    it '番地が空では登録できない' do
      @purchase_address.block = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Block can't be blank")
    end

    it '電話番号が空では登録できない' do
      @purchase_address.phone_number = ''
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号が正しい形式でないと保存できない' do
      @purchase_address.phone_number = '12345'
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include('Phone number is invalid. Input only number')
    end

    it 'tokenが空では登録できないこと' do
      @purchase_address.token = nil
      @purchase_address.valid?
      expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
