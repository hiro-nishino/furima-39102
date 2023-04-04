class Item < ApplicationRecord
  belongs_to :user
  has_many :images
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :days_to_ship


  validates :name, :detail, presence: true
  
  validates :images, :name, :info, presence: true
  validates :images, length: { minimum: 1, maximum: 5, message: "は1枚以上5枚以下にしてください" }

  validates :item_category_id, :days_to_ship_id, :item_condition_id, :shipping_charge_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください" }
 
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }, presence: { message: "半角数字を入力してください" }
  end
end
