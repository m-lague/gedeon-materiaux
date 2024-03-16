class UpvotesController < ApplicationController
  before_action :set_item, :set_upvote, only: :toggle_vote


  def toggle_vote
    authorize Upvote
    if already_upvoted?
      destroy
    else
      create
    end
  end

  private


  def set_item
    @item = params[:item_type].constantize.find(params[:item_id])
  end

  def set_upvote
    @upvote = Upvote.where(user_id: current_user.id, item: @item).first
  end

  def already_upvoted?
    @upvote
  end

  def create
    @upvote = current_user.upvotes.new(item: @item)
    authorize @upvote
    if @upvote.save
      flash[:notice] = "c'est fait!"
      respond_to do |format|
        format.html { redirect_to materials_path }
        format.turbo_stream
      end
    else
      render materials_path, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @upvote
    @upvote.destroy
    respond_to do |format|
      format.html { redirect_to materials_path, notice: "Vous avez retiré votre vote"}
      format.turbo_stream
    end
  end
end
