class MessagesController < ApplicationController

  def index
    @messages = Message.all.order('created_at DESC')
  end

  def show
    @messages = Message.all
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
        format.html { redirect_to @message, notice: 'Facility was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def message_params
      params.require(:message).permit(:body, :user_id)
    end

end
