class UsersController < ApplicationController
  def show
    @user =  User.find(current_user.id)
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    card = Card.find_by(user_id: current_user.id) 
    
    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
    @card = customer.cards.first
  end

  def update
    user = User.find(current_user.id)
    if user.update(user_params)
      redirect_to root_path
    else
      redirect_to action:'show'
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email)
  end
end
