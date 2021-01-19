class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :burden
  belongs_to :area
  belongs_to :day
  
  validate :price

  with_options presence: true, numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :burden_id
    validates :area_id
    validates :day_id
  end

  with_options presence: true do
    validates :explanation
    validates :name
    validates :image
    validates :price
  end

  validates_inclusion_of :price, in:300..9_999_999,message: 'Price Out of setting range'

  validates :price,numericality:{ with: /\A[0-9]+\z/, message: 'Half-width number' }

end
