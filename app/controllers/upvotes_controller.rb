class UpvotesController < ApplicationController
  before_action :set_item, :set_upvote

  def toggle_vote
    authorize @upvote
    if already_upvoted?
      @upvote.destroy
      respond_to do |format|
        format.html { redirect_to materials_path }
        format.turbo_stream
      end
    else
      @upvote = Upvote.new(item: @item, user: current_user)
      authorize @upvote
      if @upvote.save
        flash[:notice] = "c'est fait!"
        respond_to do |format|
          format.html { redirect_to materials_path }
          format.turbo_stream
        end
      else
        flash[:notice] = "Vous devez vous connecter"
        respond_to do |format|
          format.html { redirect_to new_user_session_path }
        end

      end
      redirect_to materials_path
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


end
