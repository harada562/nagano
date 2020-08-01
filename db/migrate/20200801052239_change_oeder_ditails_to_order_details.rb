class ChangeOederDitailsToOrderDetails < ActiveRecord::Migration[5.2]
  def change
  	 rename_table :order_ditails, :order_details
  end
end
