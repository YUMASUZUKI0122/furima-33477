require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
   
describe 'ユーザー新規登録' do

  context '新規登録できるとき' do
    it "nickname、email、password、password_confirmation、first_name、last_name、first_kananame、last_kananame、birthdayが存在すれば登録できる" do
      expect(@user).to be_valid
    end
  end
 
  context '新規登録できないとき' do
    it "nicknameが空では登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_nameが空では登録できない" do
      @user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_kananameが空では登録できない" do
      @user.first_kananame = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First kananame can't be blank")
    end
    it "last_kananameが空では登録できない" do
      @user.last_kananame = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kananame can't be blank")
    end
    it "birthdayが空では登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "重複したemailが存在する場合登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "passwordが5文字以下では登録できない" do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "first_nameは全角ひらがな、全角カタカナ、漢字のみ" do
      @user.first_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name Full-width characters")
    end
    it "last_nameは全角ひらがな、全角カタカナ、漢字のみ" do
      @user.last_name = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name Full-width characters")
    end
    it "first_kananameは全角カタカナのみ" do
      @user.first_kananame = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First kananame Full-width katakana characters")
    end
    it "last_kananameは全角カタカナのみ" do
      @user.last_kananame = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last kananame Full-width katakana characters")
    end
    it "passwordは英語のみでは登録できない" do
      @user.password = 'bbbbbb'
      @user.password_confirmation = 'bbbbbb'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
    end
    it "passwordは数字のみでは登録できない" do
      @user.password = '111111'
      @user.password_confirmation = '111111'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
    end
    it "passwordは全角では登録できない" do
      @user.password = 'ＡＡＡＡＡＡ'
      @user.password_confirmation = 'ＡＡＡＡＡＡ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password Password Include both letters and numbers")
    end
    it "emailは＠なしでは登録できない" do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
  end
end
end
