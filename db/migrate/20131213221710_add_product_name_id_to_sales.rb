class AddProductNameIdToSales < ActiveRecord::Migration
  def up
    add_column :sales, :product_name_id, :integer

    populate_product_name

    link_product_name
  end

  def down
    remove_column :sales, :product_name_id
    ProductName.delete_all
  end

  def populate_product_name
    Sale.all.each do |sale|
      ProductName.find_or_create_by(name: sale.product_name) do |pr|
        pr.name = sale.product_name
      end
    end
  end

  def link_product_name
    Sale.all.each do |sale|
      pr = ProductName.find_by(name: sale.product_name)
      sale.update_attribute(:product_name_id, pr.id)
    end
  end
end
