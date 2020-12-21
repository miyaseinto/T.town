require 'rails_helper'

describe Message do
  describe '#create' do
    context '保存できる状況' do
      it 'テキストと画像が存在すれば保存できる' do
        message = build(:message)
        expect(message).to be_valid
      end

      it '画像が空でも、テキストが入力されていれば保存できる' do
        message = build(:message, image: nil)
        expect(message).to be_valid
      end

      it 'テキストが空でも、画像が入力されていれば保存できる' do
        message = build(:message, content: nil)
        expect(message).to be_valid
      end
    end

    context '保存できない状況' do
      it 'テキストと画像が空の場合は保存できない' do
        message = build(:message, content: nil, image: nil)
        message.valid?
        expect(message.errors[:content]).to include("can't be blank")
      end
    end
  end
end
