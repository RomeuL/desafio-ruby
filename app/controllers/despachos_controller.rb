class DespachosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_despacho, only: %i[ show edit update destroy ]
  before_action :set_armeiros_guardas_armas, only: %i[new edit create update]

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
    @despacho.tipo = params[:tipo] if params[:tipo].present?
    if params[:arma_id].present? && @despacho.tipo == "Devolução"
      arma = Arma.find_by(id: params[:arma_id])
      if arma && arma.emprestada?
        ultimo_emprestimo = Despacho.where(arma_id: arma.id, tipo: "Empréstimo").order(created_at: :desc).first
        
        if ultimo_emprestimo.present?
          @despacho.arma_id = arma.id
          @despacho.guarda_id = arma.guarda_atual_id
          @despacho.quantidade_balas = ultimo_emprestimo.quantidade_balas
          @despacho.quantidade_carregadores = ultimo_emprestimo.quantidade_carregadores
          @despacho.calibre = ultimo_emprestimo.calibre
        end
      end
    end
  end

  # GET /despachos/1/edit
  def edit
  end

  # POST /despachos or /despachos.json
  def create
    @despacho = Despacho.new(despacho_params)
    if @despacho.armeiro_id.present? && @despacho.matricula_armeiro.blank?
      armeiro = Guarda.find(@despacho.armeiro_id)
      @despacho.matricula_armeiro = armeiro.matricula
    end
    
    if @despacho.guarda_id.present?
      guarda = Guarda.find(@despacho.guarda_id)
      @despacho.matricula_guarda = guarda.matricula if @despacho.matricula_guarda.blank?
      @despacho.porte_guarda = guarda.porte_arma if @despacho.porte_guarda.blank?
    end

    respond_to do |format|
      if @despacho.save_with_arma_update
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
    if despacho_params[:armeiro_id].present? && (despacho_params[:matricula_armeiro].blank? || @despacho.matricula_armeiro.blank?)
      armeiro = Guarda.find(despacho_params[:armeiro_id])
      params[:despacho][:matricula_armeiro] = armeiro.matricula
    end
    
    if despacho_params[:guarda_id].present?
      guarda = Guarda.find(despacho_params[:guarda_id])
      params[:despacho][:matricula_guarda] = guarda.matricula if despacho_params[:matricula_guarda].blank?
      params[:despacho][:porte_guarda] = guarda.porte_arma if despacho_params[:porte_guarda].blank?
    end
    
    @despacho.assign_attributes(despacho_params)
    
    respond_to do |format|
      if @despacho.save_with_arma_update
        format.html { redirect_to @despacho, notice: "Despacho atualizado." }
        format.json { render :show, status: :ok, location: @despacho }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @despacho.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @despacho.destroy!

    respond_to do |format|
      format.html { redirect_to despachos_path, status: :see_other, notice: "Despacho excluído." }
      format.json { head :no_content }
    end
  end

  private
    def set_despacho
      @despacho = Despacho.find(params[:id])
    end

    def set_armeiros_guardas_armas
      @armeiros = Guarda.where(armeiro: true) 
      @guardas = Guarda.all 
      
      if params[:tipo] == "Devolução" || @despacho&.tipo == "Devolução"
        @armas = Arma.where(emprestada: true)
      else
        @armas = Arma.where(emprestada: false)
      end
    end

    def despacho_params
      params.require(:despacho).permit(:arma_id, :quantidade_balas, :calibre, :quantidade_carregadores, :guarda_id, :porte_guarda, :matricula_guarda, :justificativa, :armeiro_id, :matricula_armeiro, :tipo)
    end
end
