class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:new, :create]


  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.all
    @carriers = Carrier.all
    @facilities = Facility.all

    if params[:search]
      @contacts = Contact.search(params[:search])
    else
      @contacts = Contact.all
    end
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    @carriers = Carrier.all
  end

  # GET /contacts/1/edit
  def edit
    @carriers = Carrier.all
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @carriers = Carrier.all
    @contact = Contact.new(contact_params)
    if !current_user.admin?
      @contact.carrier_id = Carrier.find_by_name(current_user.carrier_name).id
    end

    respond_to do |format|
      if @contact.save
        FormMailer.contact_email(@contact).deliver
        format.html { redirect_to :root, notice: 'Thank you for registering!' }
        format.json { render :root, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:name, :email, :phone, :title, :comments, :carrier_id)
    end
end
