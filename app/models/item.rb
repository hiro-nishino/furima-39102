class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item_category
  belongs_to :item_condition
  belongs_to :prefecture
  belongs_to :shipping_charge
  belongs_to :days_to_ship

  validates :image, :name, :detail, presence: true


  validates :item_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :item_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipping_charge, numericality: { other_than: 1, message: "can't be blank" }
  validates :days_to_ship, numericality: { other_than: 1, message: "can't be blank" }

  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } presence: { message: "半角数字を入れてください" }
  end
end
