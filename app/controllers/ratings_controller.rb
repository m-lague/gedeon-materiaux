class RatingsController < ApplicationController
  before_action :set_rating, only: [:show, :edit, :update, :destroy]

  def index
    @ratings = Rating.all
  end

  def show
  end

  def new
    @rating = Rating.new
  end

  def create

    @material = Material.find(params[:material_id])
    existing_rating = Rating.find_by(user_id: current_user.id, material_id: @material.id)
    authorize existing_rating
    if existing_rating
      redirect_to @material, alert: 'Vous avez déjà voté pour ce matériau.'
    else
      @rating = @material.ratings.new(rating_params)
      @rating.user = current_user


      if @rating.save
        redirect_to @material, notice: 'Ton vote est pris en compte!'
      else
        render 'materials/show'
      end
    end
  end

  def edit
  end

  def update
    if @rating.update(rating_params)
      redirect_to @rating, notice: 'Rating was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @rating.destroy
    redirect_to ratings_url, notice: 'Rating was successfully destroyed.'
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:score, :comment, :user_id, :material_id)
  end
end
