class AddSizeToFacility < ActiveRecord::Migration
  def change
    add_column :facilities, :size, :integer
  end
end
