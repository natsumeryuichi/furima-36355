require 'rails_helper'

RSpec.describe BuyerInfo, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @purchase_management = FactoryBot.build(:purchase_management, user_id: @user.id)
    @buyer_info = FactoryBot.build(:buyer_info, user_id: @user.id)
  end
  
  context '新規登録できる場合' do
    it 'token, postal_code, prefecture_id, city, address, building_name, phone_numberの値が存在すれば登録できること' do
      expect(@buyer_info).to be_valid
    end

    it '建物名が空欄でも登録できること' do
      @buyer_info.building_name = ''
      expect(@buyer_info).to be_valid
    end
  end

  context '新規登録できない場合' do
    it 'tokenが空では保存できない' do
      @buyer_info.token = ''
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("Token can't be blank")
    end

    it '郵便番号が必須であること' do
      @buyer_info.postal_code = ''
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("Postal code can't be blank")
    end

    it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと' do
      @buyer_info.postal_code = '1234567'
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("Postal code はハイフンを含めた３桁、４桁の数字で入力してください")
    end

    it '都道府県が必須であること' do
      @buyer_info.prefecture_id = ''
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '都道府県に「---」 が選択されている場合は登録できないこと' do
      @buyer_info.prefecture_id = 1
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("Prefecture can't be blank")
    end

    it '市区町村が必須であること' do
      @buyer_info.city = ''
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("City can't be blank")
    end

    it '番地が必須であること' do
      @buyer_info.address = ''
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("Address can't be blank")
    end

    it '電話番号が必須であること' do
      @buyer_info.phone_number = ''
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("Phone number can't be blank")
    end

    it '電話番号は、10桁以上半角数値のみ保存可能なこと' do
      @buyer_info.phone_number = '1234567'
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("Phone number is too short (minimum is 10 characters)")
    end

    it '電話番号は、11桁以内半角数値のみ保存可能なこと' do
      @buyer_info.phone_number = '123456791011'
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
    end

    it '電話番号は、半角数値のみ保存可能なこと' do
      @buyer_info.phone_number = '０９０１２３４５６７８'
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("Phone number is not a number")
    end

    it 'userが紐づいていなければ登録できない' do
      @buyer_info.user_id = nil
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐づいてなければ登録できない' do
      @buyer_info.item_id = nil
      @buyer_info.valid?
      expect(@buyer_info.errors.full_messages).to include("Item can't be blank")
    end
  end
end