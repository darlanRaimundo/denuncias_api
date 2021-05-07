class DenunciaController < ApplicationController
  before_action :set_denuncia, only: [:show, :update, :destroy]

  # GET /denuncia
  def index
    @denuncia = Denuncia.all

    render json: @denuncia
  end

  # GET /denuncia/1
  def show
    render json: @denuncia
  end

  # POST /denuncia
  def create
    @denuncia = Denuncia.new(denuncia_params)

    if @denuncia.save
      render json: @denuncia, status: :created, location: @denuncia
    else
      render json: @denuncia.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /denuncia/1
  def update
    if @denuncia.update(denuncia_params)
      render json: @denuncia
    else
      render json: @denuncia.errors, status: :unprocessable_entity
    end
  end

  # DELETE /denuncia/1
  def destroy
    @denuncia.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_denuncia
      @denuncia = Denuncia.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def denuncia_params
      params.require(:denuncia).permit(:descricao, :status, :latitude, :longitude, :usuario_criador, :medida)
    end
end
