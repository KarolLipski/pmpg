class RenameTypeColumn < ActiveRecord::Migration
  def change
    rename_column :publisher_addresses, :type , :address_type
  end
end
