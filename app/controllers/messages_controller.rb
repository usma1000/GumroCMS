class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @messages = Message.all.order('created_at DESC')
  end

  def show
    @user = current_user
    @email = @message.user.email
  end

  def new
    @message = Message.new
    @users = User.all
  end

  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id

    respond_to do |format|
      if @message.save
        format.html { redirect_to :root, notice: 'Message was successfully created.' }
        format.js { render :layout => false }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Message was successfully destroyed.' }
      format.json { head :no_content }
      format.js   { render :layout => false }
    end
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:body, :user_id)
    end

end
