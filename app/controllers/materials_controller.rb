class MaterialsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_material, only: [:show, :edit, :update, :destroy]

  def index
    @materials = Material.all
  end

  def show
    @material = Material.find(params[:id])
    @rating = Rating.new(material: @material)
  end

  def new
    @material = Material.new
  end

  def create
    @material = Material.new(material_params)
    @material.user = current_user
    if @material.save
      redirect_to @material, notice: 'Material was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @material.update(material_params)
      redirect_to @material, notice: 'Material was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @material.destroy
    redirect_to materials_url, notice: 'Material was successfully destroyed.'
  end

  private

  def set_material
    @material = Material.find(params[:id])
  end

  def material_params
    params.require(:material).permit(:name, :description,:category, :efficiency,
    :cost, supplier_ids: [])
  end
end
