class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :addresses, :building_name, :phone_number, :user_id, :item_id

  with_options presence: true do
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :city
    validates :addresses
    validates :token
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'はハイフンを入力してください' }
    validates :phone_number, format: { with: /\A\d{10}$|^\d{11}\z/}
    validates :item_id
    validates :user_id
  end
  def save
    order = Order.create(item_id: item_id, user_id: userid)
    adress = Adress.create( post_code: post_code, prefecture_id: prefecture_id, city: city, addresses: addresses, building_name: building_name, phone_number: phone_number)
  end
end