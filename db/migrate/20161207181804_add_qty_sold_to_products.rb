class AddQtySoldToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :qty_sold, :integer
  end
end
