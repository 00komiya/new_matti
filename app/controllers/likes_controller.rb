class LikesController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @item.create_notification_like!(current_user)
    like = current_user.likes.new(item_id: @item.id)
    like.save
    # redirect_to request.referer 非同期処理
  end

  def destroy
    @item = Item.find(params[:item_id])
    like = current_user.likes.find_by(item_id: @item.id)
    like.destroy
    # redirect_to request.referer 非同期処理
  end

end
