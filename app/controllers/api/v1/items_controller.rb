class Api::V1::ItemsController < ApplicationController
  skip_before_action :verify_authenticyty_token
  skip_before_action :check_login
  def favorite
    item = Item.find(params[:id])
    if item.favorited_by(current_user)
      #移除最愛
      # 作法1.從FavoriteItem這個model裡翻出來移除
      # FavoriteItem.find_by(item: item).destroy
      # 作法2.從現有使用者使用的商品find_by並移除
      current_user.items.find_by(item: item).destroy
      render json: {status: 'removed'}
    else
      current_user.items << item
      render json: {status: 'favorited'}
    end

    found_item = current_user.items.find_by(id: params[:id])
    if found_item
      # 找到
    else
      # 沒有
      current_user.items.create
    end

    render json: {name: 'aaa', age: 18}
  end
end
