class DropTable < ActiveRecord::Migration[5.1]
  def change
  	drop_table :products
  	drop_table :employees
  end
end
