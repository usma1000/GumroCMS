class FacilitiesController < ApplicationController
  before_action :set_facility, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:new, :create]

  # GET /facilities
  # GET /facilities.json
  def index
    @search = Facility.ransack(params[:q])
    @facilities = @search.result
  end

  # GET /facilities/1
  # GET /facilities/1.json
  def show
    @carriers = Carrier.all
  end

  # GET /facilities/new
  def new
    @facility = Facility.new
    @carriers = Carrier.all
  end

  # GET /facilities/1/edit
  def edit
    @carriers = Carrier.all
  end

  # POST /facilities
  # POST /facilities.json
  def create
    @facility = Facility.new(facility_params)
    if !current_user.admin?
      @facility.carrier_id = Carrier.find_by_name(current_user.carrier_name).id
    end

    respond_to do |format|
      if @facility.save
        FormMailer.facility_email(@facility.city, @facility.id).deliver
        format.html { redirect_to :root, notice: 'Facility was successfully created.' }
        format.json { render :root, status: :created, location: @facility }
      else
        format.html { render :new }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facilities/1
  # PATCH/PUT /facilities/1.json
  def update
    respond_to do |format|
      if @facility.update(facility_params)
        format.html { redirect_to @facility, notice: 'Facility was successfully updated.' }
        format.json { render :show, status: :ok, location: @facility }
      else
        format.html { render :edit }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facilities/1
  # DELETE /facilities/1.json
  def destroy
    @facility.destroy
    respond_to do |format|
      format.html { redirect_to facilities_url, notice: 'Facility was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_facility
      @facility = Facility.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def facility_params
      params.require(:facility).permit(:address, :city, :state, :carrier_id, :has_security, :has_CCTV, :has_fence, :has_sprinklers, :has_fire_alarm, :has_burglar_alarm, :has_drop_yard, :terminal_door_count, :hours_of_operation, :has_GPS, :has_alternate_fuel, :has_standard_equipment_types, :average_equipment_age, :size, :drivers_are_screened, :has_high_driver_turnover, :holds_driver_training, :average_theft_rate, :vehicle_count_24, :vehicle_count_26, :vehicle_count_48, :vehicle_count_53, :vehicle_count_sprinter_vans, :vehicle_count_flat_beds, :vehicle_count_reefers, :separate_caged_area_for_gas_tanks, :driver_scan, :independant_contractors, :company_drivers, :ratio_independant_company)
    end
end
