class RenameAddressColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    rename_column :addresses, :address, :address_name
  end
end
