class ChangeHoursOfOperationToString < ActiveRecord::Migration
  def up
    change_column :facilities, :hours_of_operation, :string
  end
  def down
    change_column :facilities, :hours_of_operation, :integer
  end
end
