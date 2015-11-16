class StaticPagesController < ApplicationController
  def home
    @messages = Message.all.order('created_at DESC')

    respond_to do |format|
      format.html
      format.json
    end
  end


end
