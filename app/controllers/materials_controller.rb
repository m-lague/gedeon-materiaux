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
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @material
  end

  def update
    authorize @material
    if @material.update(material_params)
      redirect_to materials_path , notice: 'Material was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @material
    @material.destroy
    respond_to do |format|
      format.html { redirect_to quotes_path, notice: "Quote was successfully destroyed."}
      format.turbo_stream
    end

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
