class AddColumnsToCarriers < ActiveRecord::Migration
  def change
    add_column :carriers, :sort_and_segregate, :boolean
    add_column :carriers, :pool_distribution, :boolean
    add_column :carriers, :participate_in_recycling_programs, :boolean
    add_column :carriers, :scanning, :boolean
    add_column :carriers, :scanning_software, :string
    remove_column :carriers, :operate_twentyfour_hours, :boolean
  end
end
