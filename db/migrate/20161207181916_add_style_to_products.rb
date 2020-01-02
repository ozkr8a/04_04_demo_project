class AddStyleToProducts < ActiveRecord::Migration[5.0]

  def up
    add_reference :products, :style
  end

  def down
    remove_reference :products, :style
  end

end
