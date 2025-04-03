class ArmasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_arma, only: %i[ show edit update destroy ]

  # GET /armas or /armas.json
  def index
    @armas = Arma.all
  end

  # GET /armas/1 or /armas/1.json
  def show
  end

  # GET /armas/new
  def new
    @arma = Arma.new
  end

  # GET /armas/1/edit
  def edit
  end

  # POST /armas or /armas.json
  def create
    @arma = Arma.new(arma_params)

    respond_to do |format|
      if @arma.save
        format.html { redirect_to @arma, notice: "Arma was successfully created." }
        format.json { render :show, status: :created, location: @arma }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @arma.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /armas/1 or /armas/1.json
  def update
    respond_to do |format|
      if @arma.update(arma_params)
        format.html { redirect_to @arma, notice: "Arma was successfully updated." }
        format.json { render :show, status: :ok, location: @arma }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @arma.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /armas/1 or /armas/1.json
  def destroy
    @arma.destroy!

    respond_to do |format|
      format.html { redirect_to armas_path, status: :see_other, notice: "Arma was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_arma
      @arma = Arma.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def arma_params
      params.expect(arma: [ :modelo, :registro, :emprestada ])
    end
end
