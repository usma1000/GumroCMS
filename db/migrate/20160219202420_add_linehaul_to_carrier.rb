class AddLinehaulToCarrier < ActiveRecord::Migration
  def change
    add_column :carriers, :final_mile_or_linehaul, :string
  end
end
