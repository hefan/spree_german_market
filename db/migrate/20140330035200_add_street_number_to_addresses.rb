class AddStreetNumberToAddresses < ActiveRecord::Migration
  def change
    add_column :spree_addresses, :street_number, :string, :length => 16
    end
end
