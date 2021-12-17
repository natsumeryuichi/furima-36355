require 'rails_helper'

RSpec.describe Item, type: :model do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品できる場合' do
      it 'image,title,explanation,categories,conditions,prefectures,shippng_charges,shipping_days,priceの値が存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      it 'imageが空では保存できないこと' do
      @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'titleが空では保存できないこと' do
        @item.title = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it 'explanationが空では保存できないこと' do
        @item.explanation =''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'category_idが空では登録できないこと' do
        @item.category_id = ''
          @item.valid?
          expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it 'condition_idが空では保存できないこと' do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it 'prefecture_idが空では保存できないこと' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'shipping_charge_idが空では保存できないこと' do
        @item.shipping_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge can't be blank")
      end

      it 'shipping_day_idが空では保存できないこと' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end

      it 'priceが空では保存されないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'priceが299円以下なら保存されないこと' do
         @item.price = 299
         @item.valid?
         expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it 'priceが10,000,000円以上では保存できないこと' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it 'priceが全角数字では保存されないこと' do
        @item.price = "４００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
    end
  end