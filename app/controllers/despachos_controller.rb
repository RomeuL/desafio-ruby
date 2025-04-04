class DespachosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_despacho, only: %i[ show edit update destroy ]
  before_action :set_armeiros_guardas_armas, only: %i[new edit]

  # GET /despachos or /despachos.json
  def index
    @despachos = Despacho.all
  end

  # GET /despachos/1 or /despachos/1.json
  def show
  end

  # GET /despachos/new
  def new
    @despacho = Despacho.new
  end

  # GET /despachos/1/edit
  def edit
  end

  # POST /despachos or /despachos.json
  def create
    @despacho = Despacho.new(despacho_params)

    respond_to do |format|
      if @despacho.save
        format.html { redirect_to @despacho, notice: "Despacho criado." }
        format.json { render :show, status: :created, location: @despacho }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @despacho.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /despachos/1 or /despachos/1.json
  def update
    respond_to do |format|
      if @despacho.update(despacho_params)
        format.html { redirect_to @despacho, notice: "Despacho atualizado." }
        format.json { render :show, status: :ok, location: @despacho }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @despacho.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /despachos/1 or /despachos/1.json
  def destroy
    @despacho.destroy!

    respond_to do |format|
      format.html { redirect_to despachos_path, status: :see_other, notice: "Despacho excluído." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_despacho
      @despacho = Despacho.find(params[:id])
    end

    def set_armeiros_guardas_armas
      @armeiros = Guarda.where(armeiro: true) 
      @guardas = Guarda.all 
      @armas = Arma.all 
    end

    # Only allow a list of trusted parameters through.
    def despacho_params
      params.require(:despacho).permit(:arma_id, :quantidade_balas, :calibre, :quantidade_carregadores, :guarda_id, :porte_guarda, :matricula_guarda, :justificativa, :armeiro_id, :matricula_armeiro, :tipo)
    end
end
