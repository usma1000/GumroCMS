class CarriersController < ApplicationController
  before_action :set_carrier, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /carriers
  # GET /carriers.json
  def index
    @carriers = Carrier.all

    if params[:search]
      @carriers = Carrier.search(params[:search])
    else
      @carriers = Carrier.all
    end
  end

  # GET /carriers/1
  # GET /carriers/1.json
  def show
  end

  # GET /carriers/new
  def new
    @carrier = Carrier.new
  end

  # GET /carriers/1/edit
  def edit
  end

  # POST /carriers
  # POST /carriers.json
  def create
    @carrier = Carrier.new(carrier_params)

    respond_to do |format|
      if @carrier.save
        format.html { redirect_to @carrier, notice: 'Carrier was successfully created.' }
        format.json { render :show, status: :created, location: @carrier }
      else
        format.html { render :new }
        format.json { render json: @carrier.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carriers/1
  # PATCH/PUT /carriers/1.json
  def update
    respond_to do |format|
      if @carrier.update(carrier_params)
        format.html { redirect_to @carrier, notice: 'Carrier was successfully updated.' }
        format.json { render :show, status: :ok, location: @carrier }
      else
        format.html { render :edit }
        format.json { render json: @carrier.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carriers/1
  # DELETE /carriers/1.json
  def destroy
    @carrier.destroy
    respond_to do |format|
      format.html { redirect_to carriers_url, notice: 'Carrier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_carrier
      @carrier = Carrier.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def carrier_params
      params.require(:carrier).permit(:name, :exp_in_retail, :exp_in_intl_cargo, :exp_in_garments_on_hangars, :exp_in_noncommercial_goods, :exp_in_replenishment, :exp_in_shop_returns, :two_year_contract, :operate_year_round, :operate_twentyfour_hours, :handle_cosmetic_products, :accept_payment_in_thirty_days, :comments, :nda)
    end
end
