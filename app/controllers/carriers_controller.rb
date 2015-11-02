class CarriersController < ApplicationController
  before_action :set_carrier, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:new, :create]

  # GET /carriers
  # GET /carriers.json
  def index
    @carriers = Carrier.all.order(:name)

    if params[:search]
      @carriers = Carrier.search(params[:search])
    else
      @carriers = Carrier.all.order(:name)
    end
  end

  def remove_nda
    @carrier = Carrier.find(params[:id])
    @carrier.nda = nil
    @carrier.save
    redirect_to @carrier, flash: { success: 'The NDA has been deleted. It will be missed.'}
  end

  def remove_contract
    @carrier = Carrier.find(params[:id])
    @carrier.contract = nil
    @carrier.save
    redirect_to @carrier, flash: { success: 'The Contract has been deleted. It will be missed.'}
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
        if !current_user.admin?
          current_user.update_attribute :carrier_name, @carrier.name
        end

        FormMailer.carrier_email(@carrier.name, @carrier.id).deliver
        format.html { redirect_to :root, notice: 'Carrier was successfully created.' }
        format.json { render :root, status: :created, location: @carrier }
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
      params.require(:carrier).permit(:name, :exp_in_retail, :exp_in_intl_cargo, :exp_in_garments_on_hangars, :exp_in_noncommercial_goods, :exp_in_replenishment, :exp_in_shop_returns, :two_year_contract, :operate_year_round, :handle_cosmetic_products, :accept_payment_in_thirty_days, :comments, :nda, :contract, :sort_and_segregate, :pool_distribution, :participate_in_recycling_programs, :scanning, :scanning_software)
    end
end
