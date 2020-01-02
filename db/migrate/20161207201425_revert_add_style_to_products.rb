require_relative '20161207181916_add_style_to_products'

class RevertAddStyleToProducts < ActiveRecord::Migration[5.0]

  def change
    revert AddStyleToProducts
  end

end
