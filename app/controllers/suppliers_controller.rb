class SuppliersController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_supplier, only: [:show, :edit, :update, :destroy]
  

  def index
    @suppliers = policy_scope(Supplier)
  end

  def show
    authorize @supplier
  end

  def new
    @supplier = Supplier.new
    authorize @supplier
  end

  def create
    @supplier = Supplier.new(supplier_params)
    authorize @supplier
    if @supplier.save
      redirect_to @supplier, notice: 'Supplier was successfully created.'
    else
      render :new
    end
  end

  def edit
    authorize @supplier
  end

  def update
    authorize @supplier
    if @supplier.update(supplier_params)
      redirect_to @supplier, notice: 'Supplier was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    authorize @supplier
    @supplier.destroy
    redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.'
  end

  private

  def set_supplier
    @supplier = Supplier.find(params[:id])
  end

  def supplier_params
    params.require(:supplier).permit(:name, :location, material_ids: [])
  end

  def user_not_authorized
    flash[:alert] = "Vous n'êtes pas autorisé à effectuer cette action."
    redirect_to(request.referrer || root_path)
  end
end
