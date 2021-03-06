class Api::V1::DenunciasController < ApplicationController
  include Paginable

  before_action :authenticate_api_user!
  before_action :set_denuncia, only: %i[show update destroy]

  # GET /denuncia
  def index
    @denuncias = Denuncia.page(current_page).per(per_page)

    render json: @denuncias, meta: meta_attributes(@denuncias), adapter: :json
  end

  # GET /denuncia/1
  def show
    render json: @denuncias
  end

  # POST /denuncia
  def create
    @denuncia = current_api_user.denuncias.new(denuncia_params)
    @denuncia.status = "Pendente"
    if @denuncia.save
      render json: @denuncia, status: :created, location: api_denuncia_url(@denuncia)
    else
      render json: @denuncia.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /denuncia/1
  def update
    if @denuncia.update(denuncia_params)
      if @denuncia.medida != ""
        @denuncia.status = 'Concluida'
        @denuncia.save
      end
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
      @denuncia = current_api_user.denuncias.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def denuncia_params
      params.require(:denuncia).permit(:descricao, :status, :latitude, :longitude, :usuario_criador, :medida)
    end
end
