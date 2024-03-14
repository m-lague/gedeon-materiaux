class UpvotesController < ApplicationController
  before_action :find_item

  def create
    if already_upvoted?
      flash[:notice] = "Vous avez déjà voté."
    else
      @upvote = Upvote.new(item: @item, user: current_user)
      authorize @upvote
      if @upvote.save
        flash[:notice] = "c'est fait!"
      else
        flash[:notice] = "qquelque chose s'est mal passé"
      end
    end
  end

  private

  def find_item
    @item = params[:item_type].constantize.find(params[:item_id])
  end

  def already_upvoted?
    Upvote.where(user_id: current_user.id, item: @item).exists?
  end
end
