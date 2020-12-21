require 'rails_helper'

describe User do
  describe '#create' do
    it '名前・メール・パスワード・確認用が存在すれば登録できる' do
      user = build(:user)
      expect(user).to be_valid
    end

    it '名前がない場合保存されない' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'emailがない場合保存できない' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'passwordがない場合保存できない' do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'メールが重複している場合は保存できない' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    it 'パスワードが存在しても確認用が空では保存できない' do
      user = build(:user, password_confirmation: '')
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end
end
