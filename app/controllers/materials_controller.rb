class MaterialsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_material, only: [:show, :edit, :update, :destroy]


  def index
    @materials = policy_scope(Material)
  end

  def show

    @material = Material.find(params[:id])
    @rating = Rating.new(material: @material)
    authorize @material
  end

  def new
    @material = Material.new
    authorize @material
  end

  def create
    @material = Material.new(material_params)
    @material.user = current_user
    authorize @material
    if @material.save
      redirect_to @material, notice: 'Material was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @material
  end

  def update
    authorize @material
    if @material.update(material_params)
      redirect_to @material, notice: 'Material was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @material
    @material.destroy
    redirect_to materials_url, notice: 'Material was successfully destroyed.'
  end

  private

  def set_material
    @material = Material.find(params[:id])
  end

  def material_params
    params.require(:material).permit(:name,:image, :description,:category, :efficiency,
    :cost, supplier_ids: [])
  end

  def user_not_authorized
    flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action."
    redirect_to(request.referrer || root_path)
  end
end
