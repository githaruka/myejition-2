require 'rails_helper'

RSpec.describe Dictionary, type: :model do
  before do
    @dictionary = FactoryBot.build(:dictionary)
  end

  describe '辞書新規投稿' do
    context '辞書新規投稿がうまくいくとき' do
      it '全ての項目の入力が存在すれば登録できる' do
        expect(@dictionary).to be_valid
      end
    end

    context '辞書新規投稿がうまくいかないとき' do
      it 'nameが空では登録できない' do
        @dictionary.name = nil
        @dictionary.valid?
        expect(@dictionary.errors.full_messages).to include("Name can't be blank")
      end

      it 'infoが空では登録できない' do
        @dictionary.info = nil
        @dictionary.valid?
        expect(@dictionary.errors.full_messages).to include("Info can't be blank")
      end

      it 'category_idが1では登録できない' do
        @dictionary.category_id = 1
        @dictionary.valid?
        expect(@dictionary.errors.full_messages).to include("Category must be other than 1")
      end
    end
  end
end
