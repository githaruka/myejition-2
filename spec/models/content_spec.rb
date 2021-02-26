require 'rails_helper'

RSpec.describe Content, type: :model do
  before do
    @dictionary = FactoryBot.create(:dictionary)
    @content = FactoryBot.build(:content)
  end

  describe '語句の追加作成' do
    context '語句の追加作成がうまくいくとき' do
      it '全ての項目の入力が存在すれば登録できる' do
        expect(@content).to be_valid
      end
    end

    context '語句の追加作成がうまくいかないとき' do
      it 'phraseが空では登録できない' do
        @content.phrase = nil
        @content.valid?
        expect(@content.errors.full_messages).to include("Phrase can't be blank")
      end

      it 'content_meanが空では登録できない' do
        @content.content_mean = nil
        @content.valid?
        expect(@content.errors.full_messages).to include("Content mean can't be blank")
      end

      it 'phrase_referenceが空では登録できない' do
        @content.phrase_reference = nil
        @content.valid?
        expect(@content.errors.full_messages).to include("Phrase reference can't be blank")
      end
    end
  end
end
