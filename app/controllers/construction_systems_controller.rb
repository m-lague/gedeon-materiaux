class ConstructionSystemsController < ApplicationController
  before_action :set_construction_system, only: [:show, :edit, :update, :destroy ]
  before_action :authorize_construction_system, only: [ :show, :edit, :update, :destroy]
  after_action :authorize_construction_system, only: :new

  def index
    @construction_systems = policy_scope(ConstructionSystem)
  end

  def show
  end

  def new
    @construction_system = ConstructionSystem.new
  end

  def create
    @construction_system = current_user.construction_systems.build(construction_system_params)
    authorize_construction_system
    if @construction_system.save
      redirect_to construction_systems_path, notice: "Système constructif créé avec succès"
    else
      render :new, status: :unprocessable_entity
    end
  end


  def edit
  end

  def update

  end

  def destroy

  end

  private

  def construction_system_params
    params.require(:construction_system).permit(:name, :description)
  end

  def set_construction_system
    @construction_system = ConstructionSystem.find(params[:id])

  end

  def authorize_construction_system
    authorize @construction_system
  end

end
