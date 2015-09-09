class AddCarriersColumns < ActiveRecord::Migration
  def change
    add_column :carriers, :exp_in_retail, :boolean
    add_column :carriers, :exp_in_intl_cargo, :boolean
    add_column :carriers, :exp_in_garments_on_hangars, :boolean
    add_column :carriers, :exp_in_noncommercial_goods, :boolean
    add_column :carriers, :exp_in_replenishment, :boolean
    add_column :carriers, :exp_in_shop_returns, :boolean
    add_column :carriers, :two_year_contract, :boolean
    add_column :carriers, :operate_year_round, :boolean
    add_column :carriers, :operate_twentyfour_hours, :boolean
    add_column :carriers, :handle_cosmetic_products, :boolean
    add_column :carriers, :accept_payment_in_thirty_days, :boolean
    add_column :carriers, :comments, :string
  end
end
