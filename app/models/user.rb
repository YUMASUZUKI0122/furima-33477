class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  with_options presence: true, format: { with: /\A(?=.*?[a-zA-Z])(?=.*?\d)[a-zA-Z\d]{6,}\z/, message: 'Include both letters and numbers' } do
    validates :password
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' } do
   validates :first_name
   validates :last_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'Full-width katakana characters' } do
   validates :first_kananame
   validates :last_kananame
  end
  with_options presence: true do
  validates :birthday
  validates :nickname
  end
end


