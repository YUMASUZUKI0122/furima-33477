class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{8,}\z/, message: 'Password Include both letters and numbers' } do
    validates :password
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' } do
   validates :first_name, presence: true
   validates :last_name, presence: true
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } do
   validates :first_kananame, presence: true
   validates :last_kananame, presence: true
  end
  validates :birthday, presence: true
  validates :nickname, presence: true
end


