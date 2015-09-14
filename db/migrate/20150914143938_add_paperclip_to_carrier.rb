class AddPaperclipToCarrier < ActiveRecord::Migration
  def change
    add_attachment :carriers, :nda
  end
end
