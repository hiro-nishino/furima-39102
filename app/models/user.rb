class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  with_options presence: true,
   format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字で入力してください' } do
    validates :first_name
    validates :last_name
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, presence: true, length: { minimum: 6 } 


  with_options presence: true,
   format: { with: /\A[\p{katakana} ー－&&[^ -~｡-ﾟ]]+\z/,message: '全角カナ文字で入力してください' } do
    validates :first_name_kana
    validates :last_name_kana
  end

  validates :birth_date, presence: true
end
