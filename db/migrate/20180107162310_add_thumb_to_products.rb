class AddThumbToProducts < ActiveRecord::Migration[5.1]
  def change
  add_column :products, :thumb, :string
  add_column :products, :standard, :string
  end
end
